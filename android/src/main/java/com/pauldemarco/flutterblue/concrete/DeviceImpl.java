package com.pauldemarco.flutterblue.concrete;

import android.util.Log;

import com.pauldemarco.flutterblue.ChannelPaths;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;
import com.pauldemarco.flutterblue.utils.MyStreamHandler;
import com.polidea.rxandroidble.RxBleConnection;
import com.polidea.rxandroidble.RxBleDevice;
import com.polidea.rxandroidble.RxBleDeviceServices;
import com.polidea.rxandroidble.scan.ScanResult;
import com.polidea.rxandroidble.utils.ConnectionSharingAdapter;

import java.util.ArrayList;
import java.util.HashMap;
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
import rx.Single;
import rx.subjects.PublishSubject;

/**
 * Created by paul on 6/21/17.
 */

public class DeviceImpl extends Device implements MethodCallHandler {
    private static final String TAG = "DeviceImpl";

    private final Guid guid;
    private final String name;
    private final RxBleDevice nativeDevice;
    private int rssi;
    private State state = State.DISCONNECTED;
    private byte[] advPacket;
    private Set<Service> services = new HashSet<>();

    private final Registrar registrar;
    private final MethodChannel methodChannel;
    private final EventChannel statusChannel;
    private final MyStreamHandler statusStream = new MyStreamHandler();

    private final PublishSubject<Void> disconnectTriggerSubject = PublishSubject.create();
    private Observable<RxBleConnection> connectionObservable;

    public DeviceImpl(Registrar registrar, Guid guid, String name, RxBleDevice nativeDevice, int rssi, byte[] advPacket) {
        this.registrar = registrar;
        this.guid = guid;
        this.name = name;
        this.rssi = rssi;
        this.nativeDevice = nativeDevice;
        this.advPacket = advPacket;
        this.state = toState(nativeDevice.getConnectionState());
        this.methodChannel = new MethodChannel(registrar.messenger(), ChannelPaths.getDeviceMethodsPath(guid.toString()));
        this.methodChannel.setMethodCallHandler(this);
        this.statusChannel = new EventChannel(registrar.messenger(), ChannelPaths.getDeviceStatusPath(guid.toString()));
        statusChannel.setStreamHandler(statusStream);
    }


    public static DeviceImpl fromScanResult(Registrar registrar, ScanResult scanResult) {
        String mac = scanResult.getBleDevice().getMacAddress();
        Guid guid = Guid.fromMac(mac);
        String name = scanResult.getBleDevice().getName();
        int rssi = scanResult.getRssi();
        RxBleDevice nativeDevice = scanResult.getBleDevice();
        byte[] advPacket = scanResult.getScanRecord().getBytes();
        return new DeviceImpl(registrar, guid, name, nativeDevice, rssi, advPacket);
    }

    public void setRssi(int rssi) {
        this.rssi = rssi;
    }

    public void setAdvPacket(byte[] advPacket){
        this.advPacket = advPacket;
    }

    @Override
    public boolean isConnected() {
        return nativeDevice.getConnectionState() == RxBleConnection.RxBleConnectionState.CONNECTED;
    }

    @Override
    public Completable connect(boolean autoConnect) {
        if(!isConnected()) {
            if(connectionObservable != null) {
                Log.e(TAG, "connect: connectionObservable not null!!");
            }
            nativeDevice.observeConnectionStateChanges()
                    .takeUntil(disconnectTriggerSubject)
                    .map((s) -> toState(s))
                    .doOnCompleted(() -> stateChanged(State.DISCONNECTED))
                    .subscribe(
                            this::stateChanged,
                            this::onConnectionStateFailure
                    );
            connectionObservable = prepareConnectionObservable(autoConnect);
            connectionObservable.subscribe(
                    rxBleConnection -> {
                        Log.d(TAG, "connect: " + this.guid.toMac() + " connected");
                    },
                    this::onConnectionFailure
            );
            return connectionObservable.first().toCompletable();
        } else {
            return Completable.error(new Throwable("Already connected to device"));
        }
    }

    @Override
    public void disconnect() {
        triggerDisconnect();
    }

    @Override
    public Guid getGuid() {
        return this.guid;
    }

    @Override
    public void stateChanged(State state) {
        Log.d(TAG, "stateChanged: " + state.ordinal());
        statusStream.onNext(state.ordinal());
    }

    @Override
    public Single<List<Service>> getServices() {
        if(isConnected()) {
            services.clear();
            return connectionObservable
                    .flatMap(RxBleConnection::discoverServices)
                    .first() // Disconnect automatically after discovery
                    .map(RxBleDeviceServices::getBluetoothGattServices)
                    .flatMapIterable(services -> services)
                    .map(service -> {
                        Service s = new ServiceImpl(registrar, service, this, connectionObservable);
                        services.add(s); // add to local set
                        return s;
                    })
                    .toList()
                    .toSingle();

        } else {
            return Single.error(new Throwable("Not connected to device"));
        }
    }

    @Override
    public Single<Service> getService(Guid id) {
        if(isConnected()) {
            return connectionObservable
                    .flatMap(RxBleConnection::discoverServices)
                    .first() // Disconnect automatically after discovery
                    .map(RxBleDeviceServices::getBluetoothGattServices)
                    .flatMapIterable(services -> services)
                    .map(service -> (Service)new ServiceImpl(registrar, service, this, connectionObservable))
                    .filter(service -> service.getGuid() == id)
                    .toSingle();

        } else {
            return Single.error(new Throwable("Not connected to device"));
        }
    }

    @Override
    public Single<Boolean> updateRssi() {
        if(isConnected()) {
            connectionObservable
                    .flatMap((connection) -> connection.readRssi())
                    .subscribe(
                            rssi -> {
                                this.rssi = rssi;
                            },
                            this::onConnectionFailure
                    );
        }
        return Single.just(true);
    }

    @Override
    public Single<Integer> requestMtu(int requestValue) {
        return null;
    }

    private Observable<RxBleConnection> prepareConnectionObservable(boolean autoConnect) {
        return nativeDevice
                .establishConnection(autoConnect)
                .takeUntil(disconnectTriggerSubject)
                .compose(new ConnectionSharingAdapter());
    }

    private void triggerDisconnect() {
        disconnectTriggerSubject.onNext(null);
    }

    private void onConnectionFailure(Throwable throwable) {
        Log.e(TAG, "onConnectionFailure" + this.guid.toMac(), throwable);
    }

    private void onConnectionStateFailure(Throwable throwable) {
        Log.e(TAG, "onConnectionStateFailure" + this.guid.toMac() + ", message:" + throwable.getMessage());
    }

    private State toState(RxBleConnection.RxBleConnectionState state) {
        // TODO: Where is the LIMITED case?
        switch(state) {
            case DISCONNECTED:
                return State.DISCONNECTED;
            case CONNECTING:
                return State.CONNECTING;
            case CONNECTED:
                return State.CONNECTED;
            case DISCONNECTING:
                return State.DISCONNECTED;
            default:
                return State.DISCONNECTED;
        }
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getServices")) {
            getServices().subscribe(
                services -> {
                    List<Map<String,Object>> maps = new ArrayList<>(services.size());
                    for(Service s : services) {
                        maps.add(s.toMap());
                    }
                    result.success(maps);
                },
                throwable -> {
                    result.error("getServices ERROR", throwable.getMessage(), throwable);
                }
            );
        } else if (call.method.equals("getService")) {
            String id = (String)call.arguments;
            Guid guid = new Guid(id);
            getService(guid).subscribe(
                service -> result.success(service.toMap()),
                throwable -> result.error("getService ERROR", throwable.getMessage(), throwable)
            );
        } else if (call.method.equals("getState")) {
            result.success(toState(nativeDevice.getConnectionState()).ordinal());
        } else {
            result.notImplemented();
        }
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", this.guid.toString());
        map.put("name", this.name);
        map.put("nativeDevice", null);
        map.put("rssi", this.rssi);
        map.put("state", this.state.ordinal());
        map.put("advPacket", this.advPacket);
        return map;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null) return false;
        if(getClass() != o.getClass()) return false;
        DeviceImpl other = (DeviceImpl) o;
        return guid.equals(other.getGuid());
    }

    @Override
    public int hashCode() {
        return this.guid.hashCode();
    }
}
