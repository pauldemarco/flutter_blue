package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGattDescriptor;

import java.util.HashMap;
import java.util.Map;

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

    public static Map<String, Object> toMap(BluetoothGattDescriptor descriptor) {
        Map<String, Object> m = new HashMap<>();
        m.put("id", new Guid(descriptor.getUuid()).toString());
        m.put("value", descriptor.getValue());
        return m;
    }
}
