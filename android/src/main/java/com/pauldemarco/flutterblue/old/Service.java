package com.pauldemarco.flutterblue;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Service {

    protected final Guid guid;

    protected final boolean isPrimary;

    protected final Device device;

    protected final Set<Service> includedServices;

    protected final List<Characteristic> characteristics;

    public Service(Guid guid, boolean isPrimary, Device device) {
        this.guid = guid;
        this.isPrimary = isPrimary;
        this.device = device;
        this.includedServices = new HashSet<>();
        this.characteristics = new ArrayList<>();
    }

    public Guid getGuid() {
        return guid;
    }

    public abstract Single<List<Service>> getIncludedServices();

    public abstract Single<List<Characteristic>> getCharacteristics();

    public abstract Single<Characteristic> getCharacteristic();

    public abstract Map<String, Object> toMap();

}
