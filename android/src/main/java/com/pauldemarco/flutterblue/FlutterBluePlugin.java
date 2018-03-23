// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.annotation.TargetApi;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanRecord;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.ParcelUuid;
import android.util.Log;

import android.support.v4.content.ContextCompat;
import android.support.v4.app.ActivityCompat;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static android.Manifest.permission.ACCESS_FINE_LOCATION;
import static android.Manifest.permission.BLUETOOTH;
import static android.Manifest.permission.BLUETOOTH_ADMIN;
import static android.content.pm.PackageManager.PERMISSION_GRANTED;


/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin implements MethodCallHandler {
    private static final String TAG = "FlutterBluePlugin";
    private static final String NAMESPACE = "plugins.pauldemarco.com/flutter_blue";
    static final private UUID CCCD_ID = UUID.fromString("000002902-0000-1000-8000-00805f9b34fb");
    private final Registrar registrar;
    private final MethodChannel channel;
    private final EventChannel stateChannel;
    private final EventChannel scanResultChannel;
    private final EventChannel servicesDiscoveredChannel;
    private final EventChannel characteristicReadChannel;
    private final EventChannel descriptorReadChannel;
    private final BluetoothManager mBluetoothManager;
    private BluetoothAdapter mBluetoothAdapter;
    private final Map<String, BluetoothGatt> mGattServers = new HashMap<>();

    private static final List<String> appPermissions = Arrays.asList(
            BLUETOOTH,
            BLUETOOTH_ADMIN,
            ACCESS_FINE_LOCATION
    );

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final FlutterBluePlugin instance = new FlutterBluePlugin(registrar);
    }

    FlutterBluePlugin(Registrar r){
        this.registrar = r;
        this.channel = new MethodChannel(registrar.messenger(), NAMESPACE+"/methods");
        this.stateChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/state");
        this.scanResultChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/scanResult");
        this.servicesDiscoveredChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/servicesDiscovered");
        this.characteristicReadChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/characteristicRead");
        this.descriptorReadChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/descriptorRead");
        this.mBluetoothManager = (BluetoothManager) r.activity().getSystemService(Context.BLUETOOTH_SERVICE);
        this.mBluetoothAdapter = mBluetoothManager.getAdapter();
        channel.setMethodCallHandler(this);
        stateChannel.setStreamHandler(stateHandler);
        scanResultChannel.setStreamHandler(scanResultsHandler);
        servicesDiscoveredChannel.setStreamHandler(servicesDiscoveredHandler);
        characteristicReadChannel.setStreamHandler(characteristicReadHandler);
        descriptorReadChannel.setStreamHandler(descriptorReadHandler);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if(mBluetoothAdapter == null && !"isAvailable".equals(call.method)) {
            result.error("bluetooth_unavailable", "the device does not have bluetooth", null);
            return;
        }

        switch (call.method) {
            case "state":
            {
                Protos.BluetoothState.Builder p = Protos.BluetoothState.newBuilder();
                try {
                    switch(mBluetoothAdapter.getState()) {
                        case BluetoothAdapter.STATE_OFF:
                            p.setState(Protos.BluetoothState.State.OFF);
                            break;
                        case BluetoothAdapter.STATE_ON:
                            p.setState(Protos.BluetoothState.State.ON);
                            break;
                        case BluetoothAdapter.STATE_TURNING_OFF:
                            p.setState(Protos.BluetoothState.State.TURNING_OFF);
                            break;
                        case BluetoothAdapter.STATE_TURNING_ON:
                            p.setState(Protos.BluetoothState.State.TURNING_ON);
                            break;
                        default:
                            p.setState(Protos.BluetoothState.State.UNKNOWN);
                            break;
                    }
                } catch (SecurityException e) {
                    p.setState(Protos.BluetoothState.State.UNAUTHORIZED);
                }
                result.success(p.build().toByteArray());
                break;
            }

            case "isAvailable":
            {
                result.success(mBluetoothAdapter != null);
                break;
            }

            case "isOn":
            {
                result.success(mBluetoothAdapter.isEnabled());
                break;
            }

            case "startScan":
            {
                if (!hasPermissions()) requestPermissions();
                byte[] data = call.arguments();
                Protos.ScanSettings request;
                try {
                    request = Protos.ScanSettings.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }
                try {
                    startScan(request);
                } catch(IllegalStateException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }
                result.success(null);
                break;
            }

            case "stopScan":
            {
                stopScan();
                result.success(null);
                break;
            }

            case "connect":
            {
                byte[] data = call.arguments();
                Protos.ConnectRequest options;
                try {
                    options = Protos.ConnectRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }
                String deviceId = options.getRemoteId();
                BluetoothDevice device = mBluetoothAdapter.getRemoteDevice(deviceId);
                boolean isConnected = mBluetoothManager.getConnectedDevices(BluetoothProfile.GATT).contains(device);

                // If device is already connected, return error
                if(mGattServers.containsKey(deviceId) && isConnected) {
                    result.error("already_connected", "connection with device already exists", null);
                    return;
                }

                // If device was connected to previously but is now disconnected, attempt a reconnect
                if(mGattServers.containsKey(deviceId) && !isConnected) {
                    if(!mGattServers.get(deviceId).connect()){
                        result.error("reconnect_error", "error when reconnecting to device", null);
                        return;
                    }
                }

                // New request, connect and add gattServer to Map
                BluetoothGatt gattServer = device.connectGatt(registrar.activity(), options.getAndroidAutoConnect(), mGattCallback);
                mGattServers.put(deviceId, gattServer);
                result.success(null);
                break;
            }

            case "disconnect":
            {
                String deviceId = (String)call.arguments;
                BluetoothGatt gattServer = mGattServers.remove(deviceId);
                if(gattServer != null) {
                    gattServer.close();
                }
                result.success(null);
                break;
            }

            case "deviceState":
            {
                String deviceId = (String)call.arguments;
                BluetoothDevice device = mBluetoothAdapter.getRemoteDevice(deviceId);
                int state = mBluetoothManager.getConnectionState(device, BluetoothProfile.GATT);
                try {
                    result.success(ProtoMaker.from(device, state).toByteArray());
                } catch(Exception e) {
                    result.error("device_state_error", e.getMessage(), null);
                }
                break;
            }

            case "discoverServices":
            {
                String deviceId = (String)call.arguments;
                BluetoothGatt gattServer = mGattServers.get(deviceId);
                if(gattServer == null) {
                    result.error("discover_services_error", "no instance of BluetoothGatt, have you connected first?", null);
                    return;
                }
                if(gattServer.discoverServices()) {
                    result.success(null);
                } else {
                    result.error("discover_services_error", "unknown reason", null);
                }
                break;
            }

            case "services":
            {
                String deviceId = (String)call.arguments;
                BluetoothGatt gattServer = mGattServers.get(deviceId);
                if(gattServer == null) {
                    result.error("get_services_error", "no instance of BluetoothGatt, have you connected first?", null);
                    return;
                }
                if(gattServer.getServices().isEmpty()) {
                    result.error("get_services_error", "services are empty, have you called discoverServices() yet?", null);
                    return;
                }
                Protos.DiscoverServicesResult.Builder p = Protos.DiscoverServicesResult.newBuilder();
                p.setRemoteId(deviceId);
                for(BluetoothGattService s : gattServer.getServices()){
                    p.addServices(ProtoMaker.from(gattServer.getDevice(), s, gattServer));
                }
                result.success(p.build().toByteArray());
                break;
            }

            case "readCharacteristic":
            {
                byte[] data = call.arguments();
                Protos.ReadCharacteristicRequest request;
                try {
                    request = Protos.ReadCharacteristicRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }

                BluetoothGatt gattServer;
                BluetoothGattCharacteristic characteristic;
                try {
                    gattServer = locateGatt(request.getRemoteId());
                    characteristic = locateCharacteristic(gattServer, request.getServiceUuid(), request.getSecondaryServiceUuid(), request.getCharacteristicUuid());
                } catch(Exception e) {
                    result.error("read_characteristic_error", e.getMessage(), null);
                    return;
                }

                if(gattServer.readCharacteristic(characteristic)) {
                    result.success(null);
                } else {
                    result.error("read_characteristic_error", "unknown reason, may occur if readCharacteristic was called before last read finished.", null);
                }
                break;
            }

            case "readDescriptor":
            {
                byte[] data = call.arguments();
                Protos.ReadDescriptorRequest request;
                try {
                    request = Protos.ReadDescriptorRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }

                BluetoothGatt gattServer;
                BluetoothGattCharacteristic characteristic;
                BluetoothGattDescriptor descriptor;
                try {
                    gattServer = locateGatt(request.getRemoteId());
                    characteristic = locateCharacteristic(gattServer, request.getServiceUuid(), request.getSecondaryServiceUuid(), request.getCharacteristicUuid());
                    descriptor = locateDescriptor(characteristic, request.getDescriptorUuid());
                } catch(Exception e) {
                    result.error("read_descriptor_error", e.getMessage(), null);
                    return;
                }

                if(gattServer.readDescriptor(descriptor)) {
                    result.success(null);
                } else {
                    result.error("read_descriptor_error", "unknown reason, may occur if readDescriptor was called before last read finished.", null);
                }
                break;
            }

            case "writeCharacteristic":
            {
                byte[] data = call.arguments();
                Protos.WriteCharacteristicRequest request;
                try {
                    request = Protos.WriteCharacteristicRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }

                BluetoothGatt gattServer;
                BluetoothGattCharacteristic characteristic;
                try {
                    gattServer = locateGatt(request.getRemoteId());
                    characteristic = locateCharacteristic(gattServer, request.getServiceUuid(), request.getSecondaryServiceUuid(), request.getCharacteristicUuid());
                } catch(Exception e) {
                    result.error("write_characteristic_error", e.getMessage(), null);
                    return;
                }

                // Set characteristic to new value
                if(!characteristic.setValue(request.getValue().toByteArray())){
                    result.error("write_characteristic_error", "could not set the local value of characteristic", null);
                }

                // Apply the correct write type
                if(request.getWriteType() == Protos.WriteCharacteristicRequest.WriteType.WITHOUT_RESPONSE) {
                    characteristic.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE);
                } else {
                    characteristic.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT);
                }

                if(!gattServer.writeCharacteristic(characteristic)){
                    result.error("write_characteristic_error", "writeCharacteristic failed", null);
                    return;
                }

                result.success(null);
                break;
            }

            case "writeDescriptor":
            {
                byte[] data = call.arguments();
                Protos.WriteDescriptorRequest request;
                try {
                    request = Protos.WriteDescriptorRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }

                BluetoothGatt gattServer;
                BluetoothGattCharacteristic characteristic;
                BluetoothGattDescriptor descriptor;
                try {
                    gattServer = locateGatt(request.getRemoteId());
                    characteristic = locateCharacteristic(gattServer, request.getServiceUuid(), request.getSecondaryServiceUuid(), request.getCharacteristicUuid());
                    descriptor = locateDescriptor(characteristic, request.getDescriptorUuid());
                } catch(Exception e) {
                    result.error("write_descriptor_error", e.getMessage(), null);
                    return;
                }

                // Set descriptor to new value
                if(!descriptor.setValue(request.getValue().toByteArray())){
                    result.error("write_descriptor_error", "could not set the local value for descriptor", null);
                }

                if(!gattServer.writeDescriptor(descriptor)){
                    result.error("write_descriptor_error", "writeCharacteristic failed", null);
                    return;
                }

                result.success(null);
                break;
            }

            case "setNotification":
            {
                byte[] data = call.arguments();
                Protos.SetNotificationRequest request;
                try {
                    request = Protos.SetNotificationRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }

                BluetoothGatt gattServer;
                BluetoothGattCharacteristic characteristic;
                BluetoothGattDescriptor cccDescriptor;
                try {
                    gattServer = locateGatt(request.getRemoteId());
                    characteristic = locateCharacteristic(gattServer, request.getServiceUuid(), request.getSecondaryServiceUuid(), request.getCharacteristicUuid());
                    cccDescriptor = characteristic.getDescriptor(CCCD_ID);
                    if(cccDescriptor == null) {
                        throw new Exception("could not locate CCCD descriptor for characteristic: " +characteristic.getUuid().toString());
                    }
                } catch(Exception e) {
                    result.error("set_notification_error", e.getMessage(), null);
                    return;
                }

                byte[] value = null;

                if(request.getEnable()) {
                    boolean canNotify = (characteristic.getProperties() & BluetoothGattCharacteristic.PROPERTY_NOTIFY) > 0;
                    boolean canIndicate = (characteristic.getProperties() & BluetoothGattCharacteristic.PROPERTY_INDICATE) > 0;
                    if(!canIndicate && !canNotify) {
                        result.error("set_notification_error", "the characteristic cannot notify or indicate", null);
                        return;
                    }
                    if(canIndicate) {
                        value = BluetoothGattDescriptor.ENABLE_INDICATION_VALUE;
                    }
                    if(canNotify) {
                        value = BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE;
                    }
                } else {
                    value = BluetoothGattDescriptor.DISABLE_NOTIFICATION_VALUE;
                }


                if(!cccDescriptor.setValue(value)) {
                    result.error("set_notification_error", "error when setting the descriptor value to: " + value, null);
                    return;
                }

                if(!gattServer.writeDescriptor(cccDescriptor)) {
                    result.error("set_notification_error", "error when writing the descriptor", null);
                    return;
                }

                if(!gattServer.setCharacteristicNotification(characteristic, request.getEnable())){
                    result.error("set_notification_error", "could not set characteristic notifications to :" + request.getEnable(), null);
                    return;
                }

                result.success(null);

                // SetNotificationResponse
                Protos.SetNotificationResponse.Builder q = Protos.SetNotificationResponse.newBuilder();
                q.setRemoteId(gattServer.getDevice().getAddress());
                q.setCharacteristic(ProtoMaker.from(characteristic, gattServer));
                channel.invokeMethod("SetNotificationResponse", q.build().toByteArray());
                break;
            }

            default:
            {
                result.notImplemented();
                break;
            }
        }
    }

    private BluetoothGatt locateGatt(String remoteId) throws Exception {
        BluetoothGatt gattServer = mGattServers.get(remoteId);
        if(gattServer == null) {
            throw new Exception("no instance of BluetoothGatt, have you connected first?");
        }
        return gattServer;
    }

    private BluetoothGattCharacteristic locateCharacteristic(BluetoothGatt gattServer, String serviceId, String secondaryServiceId, String characteristicId) throws Exception {
        BluetoothGattService primaryService = gattServer.getService(UUID.fromString(serviceId));
        if(primaryService == null) {
            throw new Exception("service (" + serviceId + ") could not be located on the device");
        }
        BluetoothGattService secondaryService = null;
        if(secondaryServiceId.length() > 0) {
            for(BluetoothGattService s : primaryService.getIncludedServices()){
                if(s.getUuid().equals(UUID.fromString(secondaryServiceId))){
                    secondaryService = s;
                }
            }
            if(secondaryService == null) {
                throw new Exception("secondary service (" + secondaryServiceId + ") could not be located on the device");
            }
        }
        BluetoothGattService service = (secondaryService != null) ? secondaryService : primaryService;
        BluetoothGattCharacteristic characteristic = service.getCharacteristic(UUID.fromString(characteristicId));
        if(characteristic == null) {
            throw new Exception("characteristic (" + characteristicId + ") could not be located in the service ("+service.getUuid().toString()+")");
        }
        return characteristic;
    }

    private BluetoothGattDescriptor locateDescriptor(BluetoothGattCharacteristic characteristic, String descriptorId) throws Exception {
        BluetoothGattDescriptor descriptor = characteristic.getDescriptor(UUID.fromString(descriptorId));
        if(descriptor == null) {
            throw new Exception("descriptor (" + descriptorId + ") could not be located in the characteristic ("+characteristic.getUuid().toString()+")");
        }
        return descriptor;
    }

    private final StreamHandler stateHandler = new StreamHandler() {
        private EventSink sink;

        private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                final String action = intent.getAction();

                if (BluetoothAdapter.ACTION_STATE_CHANGED.equals(action)) {
                    final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE,
                            BluetoothAdapter.ERROR);
                    switch (state) {
                        case BluetoothAdapter.STATE_OFF:
                            sink.success(Protos.BluetoothState.newBuilder().setState(Protos.BluetoothState.State.OFF).build().toByteArray());
                            break;
                        case BluetoothAdapter.STATE_TURNING_OFF:
                            sink.success(Protos.BluetoothState.newBuilder().setState(Protos.BluetoothState.State.TURNING_OFF).build().toByteArray());
                            break;
                        case BluetoothAdapter.STATE_ON:
                            sink.success(Protos.BluetoothState.newBuilder().setState(Protos.BluetoothState.State.ON).build().toByteArray());
                            break;
                        case BluetoothAdapter.STATE_TURNING_ON:
                            sink.success(Protos.BluetoothState.newBuilder().setState(Protos.BluetoothState.State.TURNING_ON).build().toByteArray());
                            break;
                    }
                }
            }
        };

        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            sink = eventSink;
            IntentFilter filter = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registrar.activity().registerReceiver(mReceiver, filter);
        }

        @Override
        public void onCancel(Object o) {
            sink = null;
            registrar.activity().unregisterReceiver(mReceiver);
        }
    };

    private void startScan(Protos.ScanSettings settings){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            startScan21(settings);
        } else {
            startScan18(settings);
        }
    }

    private boolean hasPermissions() {
        // Before android M, an application cannot be launched if without the required permissions
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            for (String perm : appPermissions) {
                int permStatus = ContextCompat.checkSelfPermission(registrar.activity(), perm);
                if (permStatus != PERMISSION_GRANTED) {
                    return false;
                }
            }
        }
        return true;
    }

    private void requestPermissions() {
        String[] permissionArray = appPermissions.toArray(new String[]{});
        ActivityCompat.requestPermissions(registrar.activity(), permissionArray, 0);
    }


    private void stopScan() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            stopScan21();
        } else {
            stopScan18();
        }
    }

    private ScanCallback scanCallback21;

    @TargetApi(21)
    private ScanCallback getScanCallback21() {
        if(scanCallback21 == null){
            scanCallback21 = new ScanCallback() {

                @Override
                public void onScanResult(int callbackType, ScanResult result) {
                    if(scanResultsSink != null) {
                        ScanRecord record = result.getScanRecord();
                        Protos.ScanResult scanResult = ProtoMaker.from(
                                result.getDevice(),
                                record == null ? new byte[]{} : record.getBytes(),
                                result.getRssi()
                        );
                        scanResultsSink.success(scanResult.toByteArray());
                    }
                }

                @Override
                public void onBatchScanResults(List<ScanResult> results) {
                    for (ScanResult result : results) onScanResult(0, result);
                }

                @Override
                public void onScanFailed(int errorCode) {
                    if(scanResultsSink != null) {
                        scanResultsSink.error("ScanFailed", errorMessageForCode(errorCode), errorCode);
                    }
                }

                private String errorMessageForCode(int errorCode) {
                    String errorMsg;
                    switch (errorCode) {
                        case SCAN_FAILED_ALREADY_STARTED:
                            errorMsg = "another scan with the same settings is already running";
                            break;
                        case SCAN_FAILED_APPLICATION_REGISTRATION_FAILED:
                            errorMsg = "app cannot be registered";
                            break;
                        case SCAN_FAILED_FEATURE_UNSUPPORTED:
                            errorMsg = "power optimized scan is not supported";
                            break;
                        case SCAN_FAILED_INTERNAL_ERROR:
                            errorMsg = "internal error";
                            break;
                        default:
                            errorMsg = "unknown error";
                    }
                    return errorMsg;
                }
            };
        }
        return scanCallback21;
    }


    @TargetApi(21)
    private void startScan21(Protos.ScanSettings settings) {
        BluetoothLeScanner scanner = mBluetoothAdapter.getBluetoothLeScanner();
        if (scanner == null) throw new IllegalStateException();
        ScanSettings scanSettings = new ScanSettings.Builder()
                .setScanMode(settings.getAndroidScanMode())
                .build();
        UUID[] uuids = getServiceUUIDS(settings);
        List<ScanFilter> filters = null;
        if (uuids != null) {
            filters = new ArrayList<>();
            for (UUID uuid : uuids) {
                ScanFilter filter = new ScanFilter.Builder()
                        .setServiceUuid(new ParcelUuid(uuid))
                        .build();
                filters.add(filter);
            }
        }
        scanner.startScan(filters, scanSettings, getScanCallback21());
    }

    @TargetApi(21)
    private void stopScan21() {
        BluetoothLeScanner scanner = mBluetoothAdapter.getBluetoothLeScanner();
        if (scanner != null) scanner.stopScan(getScanCallback21());
    }

    private BluetoothAdapter.LeScanCallback scanCallback18;

    private BluetoothAdapter.LeScanCallback getScanCallback18() {
        if(scanCallback18 == null) {
            scanCallback18 = new BluetoothAdapter.LeScanCallback() {
                @Override
                public void onLeScan(final BluetoothDevice bluetoothDevice, int rssi,
                                     byte[] scanRecord) {
                    if(scanResultsSink != null) {
                        Protos.ScanResult scanResult = ProtoMaker.from(bluetoothDevice, scanRecord, rssi);
                        scanResultsSink.success(scanResult.toByteArray());
                    }
                }
            };
        }
        return scanCallback18;
    }

    private void startScan18(Protos.ScanSettings settings) {
        UUID[] uuids = getServiceUUIDS(settings);
        boolean success = mBluetoothAdapter.startLeScan(uuids, getScanCallback18());
        if (!success) throw new IllegalStateException();
    }

    private void stopScan18() {
        mBluetoothAdapter.stopLeScan(getScanCallback18());
    }

    private UUID[] getServiceUUIDS(Protos.ScanSettings settings) {
        int count = settings.getServiceUuidsCount();
        if (count == 0) return null;
        UUID[] uuids = new UUID[count];
        for (int i = 0; i < count; i++){
            String uuidString = settings.getServiceUuids(i);
            uuids[i] = UUID.fromString(uuidString);
        }
        return uuids;
    }

    private EventSink scanResultsSink;
    private final StreamHandler scanResultsHandler = new StreamHandler() {
        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            scanResultsSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            scanResultsSink = null;
        }
    };

    private EventSink servicesDiscoveredSink;
    private final StreamHandler servicesDiscoveredHandler = new StreamHandler() {
        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            servicesDiscoveredSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            servicesDiscoveredSink = null;
        }
    };

    private EventSink characteristicReadSink;
    private final StreamHandler characteristicReadHandler = new StreamHandler() {
        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            characteristicReadSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            characteristicReadSink = null;
        }
    };

    private EventSink descriptorReadSink;
    private final StreamHandler descriptorReadHandler = new StreamHandler() {
        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            descriptorReadSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            descriptorReadSink = null;
        }
    };

    private final BluetoothGattCallback mGattCallback = new BluetoothGattCallback() {
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            Log.d(TAG, "onConnectionStateChange: ");
            channel.invokeMethod("DeviceState", ProtoMaker.from(gatt.getDevice(), newState).toByteArray());
        }

        @Override
        public void onServicesDiscovered(BluetoothGatt gatt, int status) {
            Log.d(TAG, "onServicesDiscovered: " + gatt.getServices().size() + " sink:" + servicesDiscoveredSink);
            if(servicesDiscoveredSink != null) {
                Protos.DiscoverServicesResult.Builder p = Protos.DiscoverServicesResult.newBuilder();
                p.setRemoteId(gatt.getDevice().getAddress());
                for(BluetoothGattService s : gatt.getServices()) {
                    p.addServices(ProtoMaker.from(gatt.getDevice(), s, gatt));
                }
                servicesDiscoveredSink.success(p.build().toByteArray());
            }
        }

        @Override
        public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            Log.d(TAG, "onCharacteristicRead: ");
            if(characteristicReadSink != null) {
                Protos.ReadCharacteristicResponse.Builder p = Protos.ReadCharacteristicResponse.newBuilder();
                p.setRemoteId(gatt.getDevice().getAddress());
                p.setCharacteristic(ProtoMaker.from(characteristic, gatt));
                characteristicReadSink.success(p.build().toByteArray());
            }
        }

        @Override
        public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            Log.d(TAG, "onCharacteristicWrite: ");
            Protos.WriteCharacteristicRequest.Builder request = Protos.WriteCharacteristicRequest.newBuilder();
            request.setRemoteId(gatt.getDevice().getAddress());
            request.setCharacteristicUuid(characteristic.getUuid().toString());
            request.setServiceUuid(characteristic.getService().getUuid().toString());
            Protos.WriteCharacteristicResponse.Builder p = Protos.WriteCharacteristicResponse.newBuilder();
            p.setRequest(request);
            p.setSuccess(status == BluetoothGatt.GATT_SUCCESS);
            channel.invokeMethod("WriteCharacteristicResponse", p.build().toByteArray());
        }

        @Override
        public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            Log.d(TAG, "onCharacteristicChanged: " + characteristic.getUuid().toString());
            Protos.OnNotificationResponse.Builder p = Protos.OnNotificationResponse.newBuilder();
            p.setRemoteId(gatt.getDevice().getAddress());
            p.setCharacteristic(ProtoMaker.from(characteristic, gatt));
            channel.invokeMethod("OnValueChanged", p.build().toByteArray());
        }

        @Override
        public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG, "onDescriptorRead: ");
            if(descriptorReadSink != null) {
                // Rebuild the ReadAttributeRequest and send back along with response
                Protos.ReadDescriptorRequest.Builder q = Protos.ReadDescriptorRequest.newBuilder();
                q.setRemoteId(gatt.getDevice().getAddress());
                q.setCharacteristicUuid(descriptor.getCharacteristic().getUuid().toString());
                q.setDescriptorUuid(descriptor.getUuid().toString());
                if(descriptor.getCharacteristic().getService().getType() == BluetoothGattService.SERVICE_TYPE_PRIMARY) {
                    q.setServiceUuid(descriptor.getCharacteristic().getService().getUuid().toString());
                } else {
                    // Reverse search to find service
                    for(BluetoothGattService s : gatt.getServices()) {
                        for(BluetoothGattService ss : s.getIncludedServices()) {
                            if(ss.getUuid().equals(descriptor.getCharacteristic().getService().getUuid())){
                                q.setServiceUuid(s.getUuid().toString());
                                q.setSecondaryServiceUuid(ss.getUuid().toString());
                                break;
                            }
                        }
                    }
                }
                Protos.ReadDescriptorResponse.Builder p = Protos.ReadDescriptorResponse.newBuilder();
                p.setRequest(q);
                p.setValue(ByteString.copyFrom(descriptor.getValue()));
                descriptorReadSink.success(p.build().toByteArray());
            }
        }

        @Override
        public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG, "onDescriptorWrite: ");
            Protos.WriteDescriptorRequest.Builder request = Protos.WriteDescriptorRequest.newBuilder();
            request.setRemoteId(gatt.getDevice().getAddress());
            request.setDescriptorUuid(descriptor.getUuid().toString());
            request.setCharacteristicUuid(descriptor.getCharacteristic().getUuid().toString());
            request.setServiceUuid(descriptor.getCharacteristic().getService().getUuid().toString());
            Protos.WriteDescriptorResponse.Builder p = Protos.WriteDescriptorResponse.newBuilder();
            p.setRequest(request);
            p.setSuccess(status == BluetoothGatt.GATT_SUCCESS);
            channel.invokeMethod("WriteDescriptorResponse", p.build().toByteArray());
        }

        @Override
        public void onReliableWriteCompleted(BluetoothGatt gatt, int status) {
            Log.d(TAG, "onReliableWriteCompleted: ");
        }

        @Override
        public void onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status) {
            Log.d(TAG, "onReadRemoteRssi: ");
        }

        @Override
        public void onMtuChanged(BluetoothGatt gatt, int mtu, int status) {
            Log.d(TAG, "onMtuChanged: ");
        }
    };

}
