package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothAdapter;
import android.util.Log;

import com.pauldemarco.flutterblue.Adapter;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.polidea.rxandroidble.RxBleClient;
import com.polidea.rxandroidble.RxBleDevice;
import com.polidea.rxandroidble.RxBleScanResult;
import com.polidea.rxandroidble.scan.ScanFilter;
import com.polidea.rxandroidble.scan.ScanResult;
import com.polidea.rxandroidble.scan.ScanSettings;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Completable;
import rx.Observable;
import rx.Subscription;
import rx.subjects.PublishSubject;

/**
 * Created by paul on 6/20/17.
 */

public class AdapterImpl extends Adapter implements MethodCallHandler {
    private static final String TAG = "Adapter";

    private final RxBleClient rxBleClient;
    private final BluetoothAdapter adapter;
    private final MethodChannel methodChannel;
    private final EventChannel scanChannel;
    private final ScanChannelHandler scanChannelHandler = new ScanChannelHandler();
    private Observable<ScanResult> scanObservable;
    private final PublishSubject<Void> stopScanningTrigger = PublishSubject.create();
    private List<Device> connectedDevices = new ArrayList<>();

    public AdapterImpl(Registrar registrar, RxBleClient rxBleClient, BluetoothAdapter adapter) {
        this.rxBleClient = rxBleClient;
        this.adapter = adapter;
        this.methodChannel = new MethodChannel(registrar.messenger(), "flutterblue.pauldemarco.com/adapter");
        this.scanChannel = new EventChannel(registrar.messenger(), "flutterblue.pauldemarco.com/adapter/scanResults");
        this.methodChannel.setMethodCallHandler(this);
        this.scanChannel.setStreamHandler(scanChannelHandler);
    }

    @Override
    public void deviceDiscovered(Device device) {
        if(scanChannelHandler.eventSink != null) {
            scanChannelHandler.eventSink.success(device);
        }
        methodChannel.invokeMethod("deviceDiscovered", device.toMap());
    }

    @Override
    public void deviceConnected(Device device) {
        methodChannel.invokeMethod("deviceConnected", device.toMap());
    }

    @Override
    public void deviceDisconnected(Device device) {
        methodChannel.invokeMethod("deviceDisconnected", device.toMap());
    }

    @Override
    public void deviceConnectionLost(Device device) {
        methodChannel.invokeMethod("deviceConnectionLost", device.toMap());
    }

    @Override
    public void scanTimeoutElapsed() {
        methodChannel.invokeMethod("scanTimeoutElapsed", null);
    }

    @Override
    public boolean isScanning() {
        return adapter.isDiscovering();
    }

    @Override
    public List<Device> getConnectedDevices() {
        return connectedDevices;
    }

    @Override
    public List<Device> getDiscoveredDevices() {
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
        // Remove device in connected list if no longer connected
        if(connectedDevices.contains(device)) {
            int oldIndex = connectedDevices.indexOf(device);
            Device existing = connectedDevices.get(oldIndex);
            if(existing.isConnected()){
                result.success("Already connected to " + existing.getGuid().toMac());
                return;
            } else {
                connectedDevices.remove(oldIndex);
            }
        }
        connectedDevices.add(device);
        device.connect(false);
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
            Device device = new DeviceImpl(guid, name, rssi, nativeDevice, null);
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

    private class ScanChannelHandler implements StreamHandler {
        public EventSink eventSink;

        @Override
        public void onListen(Object o, EventSink eventSink) {
            this.eventSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            eventSink = null;
        }
    };

    private void onScanError(Throwable e) {
        if(scanChannelHandler.eventSink != null) {
            scanChannelHandler.eventSink.error("SCAN_ERROR", e.getMessage(), e);
        }
        Log.e(TAG, "onScanError: " + e.getMessage());
    }

    private Device toDevice(ScanResult scanResult) {
        return new DeviceImpl(scanResult);
    }

}
