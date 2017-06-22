package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothGattService;
import android.util.Log;

import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;
import com.polidea.rxandroidble.RxBleConnection;
import com.polidea.rxandroidble.RxBleDevice;
import com.polidea.rxandroidble.scan.ScanResult;
import com.polidea.rxandroidble.utils.ConnectionSharingAdapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rx.Observable;
import rx.Single;
import rx.subjects.PublishSubject;

/**
 * Created by paul on 6/21/17.
 */

public class DeviceImpl extends Device {
    private static final String TAG = "DeviceImpl";

    private final Guid guid;
    private final String name;
    private final RxBleDevice nativeDevice;
    private int rssi;
    private State state = State.DISCONNECTED;
    private byte[] advPacket;

    private final PublishSubject<Void> disconnectTriggerSubject = PublishSubject.create();
    private Observable<RxBleConnection> connectionObservable;

    public DeviceImpl(Guid guid, String name, int rssi, RxBleDevice nativeDevice, byte[] advPacket) {
        this.guid = guid;
        this.name = name;
        this.rssi = rssi;
        this.nativeDevice = nativeDevice;
        this.advPacket = advPacket;
        this.state = toState(nativeDevice.getConnectionState());
    }

    public DeviceImpl(ScanResult scanResult) {
        String mac = scanResult.getBleDevice().getMacAddress();
        this.guid = Guid.fromMac(mac);
        this.name = scanResult.getBleDevice().getName();
        this.rssi = scanResult.getRssi();
        this.nativeDevice = scanResult.getBleDevice();
        this.advPacket = scanResult.getScanRecord().getBytes();
        this.state = toState(nativeDevice.getConnectionState());
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
    public boolean isConnected() {
        return nativeDevice.getConnectionState() == RxBleConnection.RxBleConnectionState.CONNECTED;
    }

    @Override
    public boolean connect(boolean autoConnect) {
        if(!isConnected()) {
            if(connectionObservable != null) {
                Log.e(TAG, "connect: connectionObservable not null!!");
            }
            connectionObservable = prepareConnectionObservable(autoConnect);
            connectionObservable.subscribe(
                    rxBleConnection -> {
                        Log.d(TAG, "connect: " + this.guid.toMac() + " connected");
                    },
                    this::onConnectionFailure
            );
        }
        return true;
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
    public Single<List<Service>> getServices() {
        if(isConnected()) {
            connectionObservable
                    .flatMap(RxBleConnection::discoverServices)
                    .first() // Disconnect automatically after discovery
                    .subscribe(
                            services -> {
                                for(BluetoothGattService service : services.getBluetoothGattServices()) {
                                    Log.d(TAG, "getServices: service uuid:" + service.getUuid().toString());
                                }
                            },
                            this::onConnectionFailure
                    );

        }
        return Single.just(new ArrayList<>());
    }

    @Override
    public Single<Service> getService(Guid id) {
        return null;
    }

    @Override
    public Single<Boolean> updateRssi() {
        return null;
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
        Log.e(TAG, "onConnectionFailure" + this.guid.toMac() + ", message:" + throwable.getMessage());
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
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null) return false;
        if(getClass() != o.getClass()) return false;
        DeviceImpl other = (DeviceImpl) o;
        return guid.equals(other.getGuid());
    }
}
