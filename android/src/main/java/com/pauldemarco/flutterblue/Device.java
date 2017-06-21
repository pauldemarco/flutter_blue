package com.pauldemarco.flutterblue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Device {

    final Guid guid;
    final String name;
    final Object nativeDevice;
    int rssi;
    protected DeviceState state = DeviceState.DISCONNECTED;
    protected byte[] advPacket;

    public Device(Guid guid, String name, int rssi, Object nativeDevice, byte[] advPacket) {
        this.guid = guid;
        this.name = name;
        this.rssi = rssi;
        this.nativeDevice = nativeDevice;
        this.advPacket = advPacket;
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

    public abstract Single<List<Service>> getServices();

    public abstract Single<Service> getService(Guid id);

    public abstract Single<Boolean> updateRssi();

    public abstract Single<Integer> requestMtu(int requestValue);

}
