package com.pauldemarco.flutterblue;

import rx.Completable;
import rx.Single;

/**
 * Created by Paul on 6/15/2017.
 */

public abstract class Descriptor {

    final Guid id;

    final String name;

    final byte[] value;

    final Characteristic characteristic;

    Descriptor(Guid id, String name, byte[] value, Characteristic characteristic) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.characteristic = characteristic;
    }

    public abstract Single<Byte[]> read();

    public abstract Completable write(byte[] data);
}
