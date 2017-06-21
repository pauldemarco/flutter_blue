package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothAdapter;
import android.util.Log;

import com.pauldemarco.flutterblue.Adapter;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.polidea.rxandroidble.RxBleClient;
import com.polidea.rxandroidble.RxBleScanResult;

import java.util.List;
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
    private Subscription scanSubscription;
    private PublishSubject<Device> scanResults;

    public AdapterImpl(Registrar registrar, RxBleClient rxBleClient, BluetoothAdapter adapter) {
        this.rxBleClient = rxBleClient;
        this.adapter = adapter;
        this.methodChannel = new MethodChannel(registrar.messenger(), "flutterblue.pauldemarco.com/adapter");
        this.scanChannel = new EventChannel(registrar.messenger(), "flutterblue.pauldemarco.com/adapter/scanResults");
        this.methodChannel.setMethodCallHandler(this);
        this.scanChannel.setStreamHandler(scanResultsHandler);
    }

    @Override
    public boolean isScanning() {
        return adapter.isDiscovering();
    }

    @Override
    public Observable<Device> deviceDiscovered() {
        if(scanResults == null) {
            scanResults = PublishSubject.create();
        }
        return scanResults;
    }

    @Override
    public List<Device> getConnectedDevices() {
        return null;
    }

    @Override
    public List<Device> getDiscoveredDevices() {
        return null;
    }

    @Override
    public boolean startScanningForDevices(Set<Guid> serviceUuids) {
        if(scanSubscription != null) {
            Log.d(TAG, "startScanningForDevices: Already Scanning");
            return false;
        }
        scanSubscription = rxBleClient.scanBleDevices()
                .map(s -> toDevice(s))
                .subscribe(
                        d -> {
                            if(scanResults != null) {
                                scanResults.onNext(d);
                            }
                        },
                        e -> {
                            if(scanResults != null) {
                                scanResults.onError(e);
                            }
                        }
                );
        return true;
    }

    @Override
    public boolean stopScanningForDevices() {
        if(scanSubscription != null) {
            scanSubscription.unsubscribe();
            scanSubscription = null;
        }
        return true;
    }

    @Override
    public Completable connectToDevice(Device device) {
        return null;
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
            result.success(stopScanningForDevices());
        } else {
            result.notImplemented();
        }
    }

    private final StreamHandler scanResultsHandler = new StreamHandler() {
        Subscription subscription;

        @Override
        public void onListen(Object o, EventSink eventSink) {
            if(subscription == null) {
                subscription = deviceDiscovered().subscribe(
                        d -> eventSink.success(d.toMap()),
                        e -> eventSink.error("SCAN_ERROR", e.getMessage(), e)
                );
            }
        }

        @Override
        public void onCancel(Object o) {
            if(subscription != null) {
                subscription.unsubscribe();
                subscription = null;
            }
        }
    };

    private Device toDevice(RxBleScanResult scanResult) {
        return DeviceImpl.fromScanResult(scanResult);
    }

}
