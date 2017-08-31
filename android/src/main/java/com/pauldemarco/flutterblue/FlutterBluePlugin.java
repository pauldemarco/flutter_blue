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
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanResult;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.util.Log;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;

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


/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin implements MethodCallHandler {
    private static final String TAG = "FlutterBluePlugin";
    private static final String NAMESPACE = "plugins.pauldemarco.com/flutter_blue";
    private final Registrar registrar;
    private final MethodChannel channel;
    private final EventChannel stateChannel;
    private final EventChannel scanResultChannel;
    private final EventChannel servicesDiscoveredChannel;
    private final EventChannel characteristicReadChannel;
    private final BluetoothManager mBluetoothManager;
    private BluetoothAdapter mBluetoothAdapter;
    private final Map<String, Result> mConnectionRequests = new HashMap<>();
    private final Map<String, BluetoothGatt> mGattServers = new HashMap<>();

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
        this.mBluetoothManager = (BluetoothManager) r.activity().getSystemService(Context.BLUETOOTH_SERVICE);
        this.mBluetoothAdapter = mBluetoothManager.getAdapter();
        channel.setMethodCallHandler(this);
        stateChannel.setStreamHandler(stateHandler);
        scanResultChannel.setStreamHandler(scanResultsHandler);
        servicesDiscoveredChannel.setStreamHandler(servicesDiscoveredHandler);
        characteristicReadChannel.setStreamHandler(characteristicReadHandler);
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
                // TODO: Request permission.
                byte[] data = call.arguments();
                Protos.ScanSettings request;
                try {
                    request = Protos.ScanSettings.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }
                startScan(request);
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
                Protos.ConnectOptions options;
                try {
                    options = Protos.ConnectOptions.newBuilder().mergeFrom(data).build();
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

                // If the device is completely new, connect and add to list
                if(!mGattServers.containsKey(deviceId)){
                    BluetoothGatt gattServer = device.connectGatt(registrar.activity(), options.getAndroidAutoConnect(), mGattCallback);
                    mGattServers.put(deviceId, gattServer);
                }

                // Update the connection requests list with this Result instance
                synchronized (mConnectionRequests) {
                    Result r = mConnectionRequests.remove(deviceId);
                    if(r != null) {
                        r.error("connect_cancelled", "another connection attempt to this device has started", null);
                    }
                    mConnectionRequests.put(deviceId, result);
                }
                break;
            }

            case "disconnect":
            {
                String deviceId = (String)call.arguments;
                BluetoothGatt gattServer = mGattServers.remove(deviceId);
                if(gattServer != null) {
                    gattServer.close();
                }
                synchronized (mConnectionRequests) {
                    Result r = mConnectionRequests.remove(deviceId);
                    if(r != null) {
                        r.error("connect_cancelled", "the connect request was cancelled", null);
                    }
                }
                result.success(null);
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
                    p.addServices(ProtoMaker.from(gattServer.getDevice(), s));
                }
                result.success(p.build().toByteArray());
                break;
            }

            case "readCharacteristic":
            {
                byte[] data = call.arguments();
                Protos.ReadAttributeRequest request;
                try {
                    request = Protos.ReadAttributeRequest.newBuilder().mergeFrom(data).build();
                } catch (InvalidProtocolBufferException e) {
                    result.error("RuntimeException", e.getMessage(), e);
                    break;
                }
                BluetoothGatt gattServer = mGattServers.get(request.getRemoteId());
                if(gattServer == null) {
                    result.error("read_characteristic_error", "no instance of BluetoothGatt, have you connected first?", null);
                    return;
                }
                BluetoothGattService primaryService = gattServer.getService(UUID.fromString(request.getServiceUuid()));
                if(primaryService == null) {
                    result.error("read_characteristic_error", "service (" + request.getServiceUuid() + ") could not be located on the device", null);
                    return;
                }
                BluetoothGattService secondaryService = null;
                if(request.getSecondaryServiceUuid().length() > 0) {
                    for(BluetoothGattService s : primaryService.getIncludedServices()){
                        if(s.getUuid().equals(UUID.fromString(request.getSecondaryServiceUuid()))){
                            secondaryService = s;
                        }
                    }
                    if(secondaryService == null) {
                        result.error("read_characteristic_error", "secondary service (" + request.getSecondaryServiceUuid() + ") could not be located on the device", null);
                        return;
                    }
                }
                BluetoothGattService service = (secondaryService != null) ? secondaryService : primaryService;
                BluetoothGattCharacteristic characteristic = service.getCharacteristic(UUID.fromString(request.getUuid()));
                if(characteristic == null) {
                    result.error("read_characteristic_error", "characteristic (" + request.getUuid() + ") could not be located in the service ("+service.getUuid().toString()+")", null);
                    return;
                }

                if(gattServer.readCharacteristic(characteristic)) {
                    result.success(null);
                } else {
                    result.error("read_characteristic_error", "unknown reason. occurs if readCharacteristic was called before last read finished.", null);
                }
                break;
            }

            default:
            {
                result.notImplemented();
                break;
            }
        }
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


    private void startScan(Protos.ScanSettings settings) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            startScan21(settings);
        } else {
            startScan18(settings);
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
                    Protos.ScanResult.Builder scanResult = Protos.ScanResult.newBuilder()
                            .setRemoteId(result.getDevice().getAddress())
                            .setName(result.getDevice().getName())
                            .setRssi(result.getRssi());
                    if(result.getScanRecord() != null) {
                        scanResult.setAdvertisementData(AdvertisementParser.parse(result.getScanRecord().getBytes()));
                    }
                    if(scanResultsSink != null) {
                        scanResultsSink.success(scanResult.build().toByteArray());
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
    private void startScan21(Protos.ScanSettings settings) {
        mBluetoothAdapter.getBluetoothLeScanner().startScan(getScanCallback21());
    }

    @TargetApi(21)
    private void stopScan21() {
        mBluetoothAdapter.getBluetoothLeScanner().stopScan(getScanCallback21());
    }

    private BluetoothAdapter.LeScanCallback scanCallback18;

    private BluetoothAdapter.LeScanCallback getScanCallback18() {
        if(scanCallback18 == null) {
            scanCallback18 = new BluetoothAdapter.LeScanCallback() {
                @Override
                public void onLeScan(final BluetoothDevice bluetoothDevice, int rssi,
                                     byte[] scanRecord) {
                    Protos.ScanResult scanResult = Protos.ScanResult.newBuilder()
                            .setRemoteId(bluetoothDevice.getAddress())
                            .setName(bluetoothDevice.getName())
                            .setRssi(rssi)
                            .setAdvertisementData(AdvertisementParser.parse(scanRecord))
                            .build();
                    if(scanResultsSink != null) {
                        scanResultsSink.success(scanResult.toByteArray());
                    }
                }
            };
        }
        return scanCallback18;
    }

    private void startScan18(Protos.ScanSettings settings) {
        mBluetoothAdapter.startLeScan(getScanCallback18());
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

    private final BluetoothGattCallback mGattCallback = new BluetoothGattCallback() {
        @Override
        public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
            Log.d(TAG, "onConnectionStateChange: ");
            synchronized (mConnectionRequests) {
                Result result = mConnectionRequests.remove(gatt.getDevice().getAddress());
                if(result != null) {
                    if(status == BluetoothGatt.GATT_SUCCESS && newState == BluetoothProfile.STATE_CONNECTED) {
                        final Protos.BluetoothDevice p = Protos.BluetoothDevice.newBuilder()
                                .setName(gatt.getDevice().getName())
                                .setRemoteId(gatt.getDevice().getAddress())
                                .setType(Protos.BluetoothDevice.Type.forNumber(gatt.getDevice().getType()))
                                .build();
                        result.success(p.toByteArray());
                    } else if(status == BluetoothGatt.GATT_SUCCESS && newState == BluetoothProfile.STATE_DISCONNECTED) {
                        result.error("connect_cancelled", "the device has been disconnected", null);
                    } else {
                        result.error("connect_error", "Error in BluetoothGattCallback, status:" + status + " newState:" + newState, null);
                    }
                }
            }
        }

        @Override
        public void onServicesDiscovered(BluetoothGatt gatt, int status) {
            Log.d(TAG, "onServicesDiscovered: " + gatt.getServices().size() + " sink:" + servicesDiscoveredSink);
            if(servicesDiscoveredSink != null) {
                Protos.DiscoverServicesResult.Builder p = Protos.DiscoverServicesResult.newBuilder();
                p.setRemoteId(gatt.getDevice().getAddress());
                for(BluetoothGattService s : gatt.getServices()) {
                    p.addServices(ProtoMaker.from(gatt.getDevice(), s));
                }
                servicesDiscoveredSink.success(p.build().toByteArray());
            }
        }

        @Override
        public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            Log.d(TAG, "onCharacteristicRead: ");
            if(characteristicReadSink != null) {
                // Rebuild the ReadAttributeRequest and send back along with response
                Protos.ReadAttributeRequest.Builder q = Protos.ReadAttributeRequest.newBuilder();
                q.setRemoteId(gatt.getDevice().getAddress());
                q.setUuid(characteristic.getUuid().toString());
                if(characteristic.getService().getType() == BluetoothGattService.SERVICE_TYPE_PRIMARY) {
                    q.setServiceUuid(characteristic.getService().getUuid().toString());
                } else {
                    // Reverse search to find service
                    for(BluetoothGattService s : gatt.getServices()) {
                        for(BluetoothGattService ss : s.getIncludedServices()) {
                            if(ss.getUuid().equals(characteristic.getService().getUuid())){
                                q.setServiceUuid(s.getUuid().toString());
                                q.setSecondaryServiceUuid(ss.getUuid().toString());
                                break;
                            }
                        }
                    }
                }
                Protos.ReadAttributeResponse.Builder p = Protos.ReadAttributeResponse.newBuilder();
                p.setRequest(q);
                p.setValue(ByteString.copyFrom(characteristic.getValue()));
                characteristicReadSink.success(p.build().toByteArray());
            }
        }

        @Override
        public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
            Log.d(TAG, "onCharacteristicWrite: ");
        }

        @Override
        public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
            Log.d(TAG, "onCharacteristicChanged: ");
        }

        @Override
        public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG, "onDescriptorRead: ");
        }

        @Override
        public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
            Log.d(TAG, "onDescriptorWrite: ");
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
