package com.pauldemarco.flutterblue;

import java.util.List;

import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Service {

    final Guid guid;

    final String name;

    final boolean isPrimary;

    final Device device;

    public Service(Guid guid, String name, boolean isPrimary, Device device) {
        this.guid = guid;
        this.name = name;
        this.isPrimary = isPrimary;
        this.device = device;
    }

    public abstract Single<List<Characteristic>> getCharacteristics();

    public abstract Single<Characteristic> getCharacteristic();

}
