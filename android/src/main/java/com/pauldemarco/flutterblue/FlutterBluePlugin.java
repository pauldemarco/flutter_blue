// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.Manifest;
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
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.ParcelUuid;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentLinkedQueue;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener;

/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin implements MethodCallHandler, GattOperation.FinishedCallback {
    private static final String TAG = "FlutterBluePlugin";
    private static final String NAMESPACE = "plugins.pauldemarco.com/flutter_blue";
    private final Registrar registrar;
    private final MethodChannel channel;
    private final EventChannel stateChannel;
    private final EventChannel scanResultChannel;
    private final BluetoothManager mBluetoothManager;
    private BluetoothAdapter mBluetoothAdapter;
    private final Map<String, BluetoothGatt> mGattServers = new HashMap<>();

    private ConcurrentLinkedQueue<GattOperation> mQueue;
    private GattOperation mCurrentOperation;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final FlutterBluePlugin instance = new FlutterBluePlugin(registrar);
        registrar.addRequestPermissionsResultListener(instance);
    }

    FlutterBluePlugin(Registrar r){
        this.registrar = r;
        this.channel = new MethodChannel(registrar.messenger(), NAMESPACE+"/methods");
        this.stateChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/state");
        this.scanResultChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/scanResult");
        this.mBluetoothManager = (BluetoothManager) r.activity().getSystemService(Context.BLUETOOTH_SERVICE);
        this.mBluetoothAdapter = mBluetoothManager.getAdapter();
        channel.setMethodCallHandler(this);
        stateChannel.setStreamHandler(stateHandler);
        scanResultChannel.setStreamHandler(scanResultsHandler);

        driveQueue();
    }

    private void driveQueue() {
        if (mCurrentOperation!=null) {
            return;
        }
        if (mQueue.size() == 0) {
            return;
        }

        final GattOperation op = mQueue.poll();

        mCurrentOperation = op;
        op.execute();
    }

    public void onGattOperationFinished() {
        mCurrentOperation = null;
        driveQueue();
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if(mBluetoothAdapter == null && !"isAvailable".equals(call.method)) {
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
                if (ContextCompat.checkSelfPermission(registrar.activity(), Manifest.permission.ACCESS_COARSE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(
                            registrar.activity(),
                            new String[] {
                                    Manifest.permission.ACCESS_COARSE_LOCATION
                            },
                            REQUEST_COARSE_LOCATION_PERMISSIONS);
                    pendingCall = call;
                    pendingResult = result;
                    break;
                }
                startScan(call, result);
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

                queueOperation(new DiscoverServicesOperation(gattServer, result, this));

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

                queueOperation(new ReadCharacteristicOperation(gattServer, characteristic, result, this));
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

                queueOperation(new ReadDescriptorOperation(gattServer, descriptor, result, this));
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

                queueOperation(new WriteCharacteristicOperation(gattServer, characteristic, result, this));
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

                queueOperation(new WriteDescriptorOperation(gattServer, descriptor, result, this));
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
                } catch(Exception e) {
                    result.error("set_notification_error", e.getMessage(), null);
                    return;
                }

                queueOperation(new SetNotificationOperation(gattServer, characteristic, request.getEnable(), result, this));
                break;
            }

            default:
            {
                result.notImplemented();
                break;
            }
        }
    }

    @Override
    public boolean onRequestPermissionsResult(
            int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_COARSE_LOCATION_PERMISSIONS) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                startScan(pendingCall, pendingResult);
            } else {
                pendingResult.error(
                        "no_permissions", "flutter_blue plugin requires location permissions for scanning", null);
                pendingResult = null;
                pendingCall = null;
            }
            return true;
        }
        return false;
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

                if (action.equals(BluetoothAdapter.ACTION_STATE_CHANGED)) {
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

    private void startScan(MethodCall call, Result result) {
        byte[] data = call.arguments();
        Protos.ScanSettings settings;
        try {
            settings = Protos.ScanSettings.newBuilder().mergeFrom(data).build();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                startScan21(settings);
            } else {
                startScan18(settings);
            }
            result.success(null);
        } catch (Exception e) {
            result.error("startScan", e.getMessage(), e);
        }
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
                    super.onScanResult(callbackType, result);
                    if(scanResultsSink != null) {
                        Protos.ScanResult scanResult = ProtoMaker.from(result.getDevice(), result);
                        scanResultsSink.success(scanResult.toByteArray());
                    }
                }

                @Override
                public void onBatchScanResults(List<ScanResult> results) {
                    super.onBatchScanResults(results);

                }

                @Override
                public void onScanFailed(int errorCode) {
                    super.onScanFailed(errorCode);
                }
            };
        }
        return scanCallback21;
    }

    @TargetApi(21)
    private void startScan21(Protos.ScanSettings proto) throws IllegalStateException {
        BluetoothLeScanner scanner = mBluetoothAdapter.getBluetoothLeScanner();
        if(scanner == null) throw new IllegalStateException("getBluetoothLeScanner() is null. Is the Adapter on?");
        int scanMode = proto.getAndroidScanMode();
        int count = proto.getServiceUuidsCount();
        List<ScanFilter> filters = new ArrayList<>(count);
        for(int i = 0; i < count; i++) {
            String uuid = proto.getServiceUuids(i);
            ScanFilter f = new ScanFilter.Builder().setServiceUuid(ParcelUuid.fromString(uuid)).build();
            filters.add(f);
        }
        ScanSettings settings = new ScanSettings.Builder().setScanMode(scanMode).build();
        scanner.startScan(filters, settings, getScanCallback21());
    }

    @TargetApi(21)
    private void stopScan21() {
        BluetoothLeScanner scanner = mBluetoothAdapter.getBluetoothLeScanner();
        if(scanner != null) scanner.stopScan(getScanCallback21());
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

    private void startScan18(Protos.ScanSettings proto) throws IllegalStateException {
        List<String> serviceUuids = proto.getServiceUuidsList();
        UUID[] uuids = new UUID[serviceUuids.size()];
        for(int i = 0; i < serviceUuids.size(); i++) {
            uuids[0] = UUID.fromString(serviceUuids.get(0));
        }
        boolean success = mBluetoothAdapter.startLeScan(uuids, getScanCallback18());
        if(!success) throw new IllegalStateException("getBluetoothLeScanner() is null. Is the Adapter on?");
    }

    private void stopScan18() {
        mBluetoothAdapter.stopLeScan(getScanCallback18());
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

    private final BluetoothGattCallback mGattCallback = new BluetoothGattCallback() {
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            Log.d(TAG, "onConnectionStateChange: ");
            channel.invokeMethod("DeviceState", ProtoMaker.from(gatt.getDevice(), newState).toByteArray());
        }

        @Override
        public void onServicesDiscovered(BluetoothGatt gatt, int status) {
            if (mCurrentOperation!=null) mCurrentOperation.onServicesDiscovered(gatt, status);
            else Log.w(TAG, "onServicesDiscovered, but no operation in progress");
        }

        @Override
        public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            if (mCurrentOperation!=null) mCurrentOperation.onCharacteristicRead(gatt, characteristic, status);
            else Log.w(TAG, "onCharacteristicRead, but no operation in progress");
        }

        @Override
        public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            if (mCurrentOperation!=null) mCurrentOperation.onCharacteristicWrite(gatt, characteristic, status);
            else Log.w(TAG, "onCharacteristicWrite, but no operation in progress");
        }

        @Override
        public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            Protos.OnNotificationResponse.Builder q = Protos.OnNotificationResponse.newBuilder();
            q.setRemoteId(gatt.getDevice().getAddress());
            q.setCharacteristic(ProtoMaker.from(characteristic, gatt));
            channel.invokeMethod("CharacteristicChanged", q.build().toByteArray());
        }

        @Override
        public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            if (mCurrentOperation!=null) mCurrentOperation.onDescriptorRead(gatt, descriptor, status);
            else Log.w(TAG, "onDescriptorRead, but no operation in progress");
        }

        @Override
        public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            if (mCurrentOperation!=null) mCurrentOperation.onDescriptorWrite(gatt, descriptor, status);
            else Log.w(TAG, "onDescriptorWrite, but no operation in progress");
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
