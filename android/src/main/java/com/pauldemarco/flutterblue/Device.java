package com.pauldemarco.flutterblue;

import java.util.List;

import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Device {

    final Guid guid;
    final String name;
    final Object nativeDevice;
    int rssi;
    DeviceState state;
    List<AdvertisementRecord> advertisementRecords;

    public Device(Guid guid, String name, Object nativeDevice) {
        this.guid = guid;
        this.name = name;
        this.nativeDevice = nativeDevice;
    }

    public abstract Single<List<Service>> getServices();

    public abstract Single<Service> getService(Guid id);

    public abstract Single<Boolean> updateRssi();

    public abstract Single<Integer> requestMtu(int requestValue);

}
