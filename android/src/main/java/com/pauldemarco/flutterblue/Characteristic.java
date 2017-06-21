package com.pauldemarco.flutterblue;

import java.util.List;

import rx.Completable;
import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Characteristic {

    final Guid guid;

    final String uuid;

    final String name;

    final CharacteristicPropertyType properties;

    final CharacteristicWriteType writeType;

    final boolean canRead;

    final boolean canWrite;

    final boolean canUpdate;

    final Service service;

    public Characteristic(Guid guid, String uuid, String name, CharacteristicPropertyType properties, CharacteristicWriteType writeType, boolean canRead, boolean canWrite, boolean canUpdate, Service service) {
        this.guid = guid;
        this.uuid = uuid;
        this.name = name;
        this.properties = properties;
        this.writeType = writeType;
        this.canRead = canRead;
        this.canWrite = canWrite;
        this.canUpdate = canUpdate;
        this.service = service;
    }

    byte[] value;

    public String getStringValue() {
        return new String(value);
    }

    public abstract Single<Byte[]> read();

    public abstract Single<Boolean> write(byte[] data);

    public abstract Completable startUpdates();

    public abstract Completable stopUpdates();

    public abstract Single<List<Descriptor>> getDescriptors();

    public abstract Single<Descriptor> getDescriptor(Guid id);
}
