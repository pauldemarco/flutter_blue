package com.pauldemarco.flutterblue;

import java.util.List;
import java.util.Map;

import rx.Completable;
import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Characteristic {

    protected final Guid guid;

    protected final String name;

    protected final int properties;

    protected final CharacteristicWriteType writeType;

    protected final boolean canRead;

    protected final boolean canReadEncrypted;

    protected final boolean canWrite;

    protected final boolean canWriteEncrypted;

    protected final Service service;

    protected final Device device;

    public Characteristic(Guid guid, String name, int properties, CharacteristicWriteType writeType, boolean canRead, boolean canReadEncrypted, boolean canWrite, boolean canWriteEncrypted, Service service, Device device) {
        this.guid = guid;
        this.name = name;
        this.properties = properties;
        this.writeType = writeType;
        this.canRead = canRead;
        this.canReadEncrypted = canReadEncrypted;
        this.canWrite = canWrite;
        this.canWriteEncrypted = canWriteEncrypted;
        this.service = service;
        this.device = device;
    }

    public Guid getGuid() {
        return guid;
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

    public abstract Map<String, Object> toMap();
}
