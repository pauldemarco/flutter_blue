package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothAdapter;
import android.util.Log;

import com.pauldemarco.flutterblue.Adapter;
import com.pauldemarco.flutterblue.ChannelPaths;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.utils.MyStreamHandler;
import com.polidea.rxandroidble.RxBleClient;
import com.polidea.rxandroidble.RxBleDevice;
import com.polidea.rxandroidble.scan.ScanFilter;
import com.polidea.rxandroidble.scan.ScanResult;
import com.polidea.rxandroidble.scan.ScanSettings;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Completable;
import rx.Observable;
import rx.subjects.PublishSubject;

/**
 * Created by paul on 6/20/17.
 */

public class AdapterImpl extends Adapter implements MethodCallHandler {
    private static final String TAG = "AdapterImpl";

    private final Registrar registrar;
    private final RxBleClient rxBleClient;
    private final BluetoothAdapter adapter;
    private final MethodChannel methodChannel;
    private final EventChannel discoveredChannel;
    private final EventChannel connectedChannel;
    private final MyStreamHandler discoveredStream = new MyStreamHandler();
    private final MyStreamHandler connectedStream = new MyStreamHandler();
    private Observable<ScanResult> scanObservable;
    private final PublishSubject<Void> stopScanningTrigger = PublishSubject.create();
    private Set<Device> connectedDevices = new HashSet<>();

    public AdapterImpl(Registrar registrar, RxBleClient rxBleClient, BluetoothAdapter adapter) {
        this.registrar = registrar;
        this.rxBleClient = rxBleClient;
        this.adapter = adapter;
        this.methodChannel = new MethodChannel(registrar.messenger(), ChannelPaths.ADAPTER_METHODS);
        this.methodChannel.setMethodCallHandler(this);
        this.discoveredChannel = new EventChannel(registrar.messenger(), ChannelPaths.ADAPTER_DEVICE_DISCOVERED);
        this.discoveredChannel.setStreamHandler(discoveredStream);
        this.connectedChannel = new EventChannel(registrar.messenger(), ChannelPaths.ADAPTER_DEVICE_CONNECTED);
        this.connectedChannel.setStreamHandler(connectedStream);
    }

    @Override
    public void deviceDiscovered(Device device) {
        discoveredStream.onNext(device.toMap());
    }

    @Override
    public void deviceConnected(Device device) {
        connectedDevices.add(device);
        connectedStream.onNext(device.toMap());
    }

    @Override
    public void deviceDisconnected(Device device) {
    }

    @Override
    public void deviceConnectionLost(Device device) {
    }

    @Override
    public void scanTimeoutElapsed() {
    }

    @Override
    public boolean isScanning() {
        return adapter.isDiscovering();
    }

    @Override
    public Set<Device> getConnectedDevices() {
        return connectedDevices;
    }

    @Override
    public Set<Device> getDiscoveredDevices() {
        return null;
    }

    @Override
    public boolean startScanningForDevices(Set<Guid> serviceUuids) {
        if(!isScanning()) {
            scanObservable = prepareScanObservable();
            scanObservable
                    .map(this::toDevice)
                    .subscribe(
                            this::deviceDiscovered,
                            this::onScanError
                    );
        }
        return true;
    }

    @Override
    public void stopScanningForDevices() {
        stopScanningTrigger.onNext(null);
    }

    @Override
    public Completable connectToDevice(Device device) {
        // TODO: Handle situation where device is already in connected list
        if(connectedDevices.contains(device)) {
            // Device d = connectedDevices.get(connectedDevices.indexOf(device));
            // d.disconnect();
            connectedDevices.remove(device);
        }
        device.connect(false);
        deviceConnected(device);
        return Completable.complete();
    }

    @Override
    public Completable disconnectDevice(Device device) {
        return null;
    }

    @Override
    public Completable connectToKnownDevice(Guid deviceGuid) {
        return null;
    }

    @Override
    public List<Device> getSystemConnectedOrPairedDevices(Set<Guid> services) {
        return null;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("isScanning")) {
            result.success(isScanning());
        } else if(call.method.equals("startScanningForDevices")) {
            result.success(startScanningForDevices(null));
        } else if(call.method.equals("stopScanningForDevices")) {
            stopScanningForDevices();
            result.success(true);
        } else if(call.method.equals("connectToDevice")) {
            Map<String, Object> map = (Map<String, Object>)call.arguments;
            String id = (String)map.get("id");
            Guid guid = new Guid(id);
            String name = (String)map.get("name");
            int rssi = (int) map.get("rssi");
            RxBleDevice nativeDevice = rxBleClient.getBleDevice(guid.toMac());
            Device device = new DeviceImpl(registrar, guid, name, nativeDevice, rssi, null);
            connectToDevice(device).subscribe(
                    () -> result.success("Requested connection to " + device.getGuid().toMac()),
                    throwable -> result.error("Device connection error", throwable.getMessage(), throwable)
            );
        } else {
            result.notImplemented();
        }
    }

    private Observable<ScanResult> prepareScanObservable() {
        return rxBleClient.scanBleDevices(
                new ScanSettings.Builder()
                        // setScanMode
                        .build(),
                new ScanFilter.Builder()
                        // setServiceUUIDs
                        .build()
        )
                .takeUntil(stopScanningTrigger);
    }

    private void onScanError(Throwable e) {
        discoveredStream.onError("SCAN_ERROR", e);
        Log.e(TAG, "onScanError: " + e.getMessage(), e);
    }

    private DeviceImpl toDevice(ScanResult scanResult) {
        return DeviceImpl.fromScanResult(registrar, scanResult);
    }

}
