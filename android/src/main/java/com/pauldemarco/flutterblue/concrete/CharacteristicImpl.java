package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothGattCharacteristic;
import android.util.Log;

import com.pauldemarco.flutterblue.ChannelPaths;
import com.pauldemarco.flutterblue.Characteristic;
import com.pauldemarco.flutterblue.CharacteristicWriteType;
import com.pauldemarco.flutterblue.Descriptor;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Completable;
import rx.Single;

/**
 * Created by paul on 6/29/17.
 */

public class CharacteristicImpl extends Characteristic {

    private final Registrar registrar;
    private final MethodChannel methodChannel;

    public CharacteristicImpl(Registrar registrar, Guid guid, String name, int properties, CharacteristicWriteType writeType, boolean canRead, boolean canReadEncrypted, boolean canWrite, boolean canWriteEncrypted, Service service, Device device) {
        super(guid, name, properties, writeType, canRead, canReadEncrypted, canWrite, canWriteEncrypted, service, device);
        this.registrar = registrar;
        this.methodChannel = new MethodChannel(registrar.messenger(), ChannelPaths.getCharacteristicMethodsPath(device.getGuid().toString(), service.getGuid().toString(), guid.toString()));
    }

    public static CharacteristicImpl fromGattCharacteristic(Registrar registrar, BluetoothGattCharacteristic c, Service service, Device device) {
        Guid guid = new Guid(c.getUuid());
        String name = null; // TODO: Get name if UUID is a known characteristic (do this on dart side instead?)
        int properties = c.getProperties();
        int writeTypeInt = c.getWriteType();
        CharacteristicWriteType writeType = CharacteristicWriteType.DEFAULT;
        switch(writeTypeInt) {
            case BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE:
                writeType = CharacteristicWriteType.WITHOUT_RESPONSE;
                break;
            case BluetoothGattCharacteristic.WRITE_TYPE_SIGNED:
                writeType = CharacteristicWriteType.WITH_RESPONSE;
                break;
        }
        // Permissions will always be zero, see issue #6
        int permissions = c.getPermissions();
        boolean canRead = (permissions & BluetoothGattCharacteristic.PERMISSION_READ) == BluetoothGattCharacteristic.PERMISSION_READ;
        boolean canReadEncrypted = (permissions & BluetoothGattCharacteristic.PERMISSION_READ_ENCRYPTED) == BluetoothGattCharacteristic.PERMISSION_READ_ENCRYPTED;
        boolean canWrite = (permissions & BluetoothGattCharacteristic.PERMISSION_WRITE) == BluetoothGattCharacteristic.PERMISSION_WRITE;
        boolean canWriteEncrypted = (permissions & BluetoothGattCharacteristic.PERMISSION_WRITE_ENCRYPTED) == BluetoothGattCharacteristic.PERMISSION_WRITE_ENCRYPTED;
        return new CharacteristicImpl(registrar, guid, name, properties, writeType, canRead, canReadEncrypted, canWrite, canWriteEncrypted, service, device);
    }

    @Override
    public Single<Byte[]> read() {
        return null;
    }

    @Override
    public Single<Boolean> write(byte[] data) {
        return null;
    }

    @Override
    public Completable startUpdates() {
        return null;
    }

    @Override
    public Completable stopUpdates() {
        return null;
    }

    @Override
    public Single<List<Descriptor>> getDescriptors() {
        return null;
    }

    @Override
    public Single<Descriptor> getDescriptor(Guid id) {
        return null;
    }

    @Override
    public Map<String, Object> toMap() {
        Map<String, Object> m = new HashMap<>();
        m.put("id", this.guid.toString());
        m.put("name", this.name);
        m.put("properties", this.properties);
        m.put("writeType", this.writeType.ordinal());
        m.put("canRead", this.canRead);
        m.put("canReadEncrypted", this.canReadEncrypted);
        m.put("canWrite", this.canWrite);
        m.put("canWriteEncrypted", this.canWriteEncrypted);
        return m;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null) return false;
        if(getClass() != o.getClass()) return false;
        CharacteristicImpl other = (CharacteristicImpl) o;
        return guid.equals(other.getGuid());
    }

    @Override
    public int hashCode() {
        return this.guid.hashCode();
    }
}
