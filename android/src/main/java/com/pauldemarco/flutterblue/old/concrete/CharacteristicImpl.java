package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.util.Log;

import com.pauldemarco.flutterblue.ChannelPaths;
import com.pauldemarco.flutterblue.Characteristic;
import com.pauldemarco.flutterblue.CharacteristicPropertyType;
import com.pauldemarco.flutterblue.CharacteristicWriteType;
import com.pauldemarco.flutterblue.Descriptor;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;
import com.pauldemarco.flutterblue.utils.MyStreamHandler;
import com.polidea.rxandroidble.RxBleConnection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Completable;
import rx.Observable;
import rx.Single;
import rx.subjects.PublishSubject;

/**
 * Created by paul on 6/29/17.
 */

public class CharacteristicImpl extends Characteristic implements MethodCallHandler {
    private static final String TAG = "CharacteristicImpl";

    private final Registrar registrar;
    private final MethodChannel methodChannel;
    private final EventChannel valueChannel;
    private final MyStreamHandler valueStream = new MyStreamHandler();
    private final Observable<RxBleConnection> connectionObservable;
    private final BluetoothGattCharacteristic nativeCharacteristic;
    private final PublishSubject<Void> stopUpdatesTriggerSubject = PublishSubject.create();

    public CharacteristicImpl(Registrar registrar, Guid guid, String name, int properties, CharacteristicWriteType writeType, Service service, Device device, Observable<RxBleConnection> connectionObservable, BluetoothGattCharacteristic nativeCharacteristic) {
        super(guid, name, properties, writeType, service, device);
        this.registrar = registrar;
        this.methodChannel = new MethodChannel(registrar.messenger(), ChannelPaths.getCharacteristicMethodsPath(device.getGuid().toString(), service.getGuid().toString(), guid.toString()));
        this.methodChannel.setMethodCallHandler(this);
        this.valueChannel = new EventChannel(registrar.messenger(), ChannelPaths.getCharacteristicValuePath(device.getGuid().toString(), service.getGuid().toString(), guid.toString()));
        this.valueChannel.setStreamHandler(valueStream);
        this.connectionObservable = connectionObservable;
        this.nativeCharacteristic = nativeCharacteristic;
    }

    public static CharacteristicImpl fromGattCharacteristic(Registrar registrar, BluetoothGattCharacteristic c, Service service, Device device, Observable<RxBleConnection> connectionObservable) {
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
        // c.getPermissions() will always be zero, see issue #6. Use only client properties instead
        return new CharacteristicImpl(registrar, guid, name, properties, writeType, service, device, connectionObservable, c);
    }

    @Override
    public Single<byte[]> read() {
        return connectionObservable
                .flatMap(rxBleConnection -> rxBleConnection.readCharacteristic(guid.toUUID()))
                .doOnNext(valueStream::onNext)
                .first()
                .toSingle();
    }

    @Override
    public Completable write(byte[] data) {
        return connectionObservable
                .flatMap(rxBleConnection -> rxBleConnection.writeCharacteristic(guid.toUUID(), data))
                //.doOnNext(valueStream::onNext)
                .toCompletable();
    }

    @Override
    public Completable startUpdates() {
        Observable o;
        if((this.properties & CharacteristicPropertyType.NOTIFY) == CharacteristicPropertyType.NOTIFY){
            o = connectionObservable.flatMap(rxBleConnection -> rxBleConnection.setupNotification(guid.toUUID()));
        } else if((this.properties & CharacteristicPropertyType.INDICATE) == CharacteristicPropertyType.INDICATE) {
            o = connectionObservable.flatMap(rxBleConnection -> rxBleConnection.setupIndication(guid.toUUID()));
        } else {
            return Completable.error(new Throwable("Characteristics does not have notify or indicate property enabled"));
        }
        Observable<byte[]> d = o.flatMap(notificationObservable -> notificationObservable);
        d.takeUntil(stopUpdatesTriggerSubject)
                .subscribe(valueStream::onNext, this::onReadError);
        return Completable.fromObservable(o.first());
    }

    @Override
    public void stopUpdates() {
        stopUpdatesTriggerSubject.onNext(null);
    }

    @Override
    public Single<List<Descriptor>> getDescriptors() {
        return null;
    }

    @Override
    public Single<Descriptor> getDescriptor(Guid id) {
        return null;
    }

    private void onReadError(Throwable t) {
        Log.e(TAG, "onReadError: ", t);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("read")) {
            read().subscribe(
                    bytes -> result.success(bytes),
                    throwable -> result.error("READ_ERROR", throwable.getMessage(), null)
            );
        } else if (call.method.equals("write")) {
            byte[] data = (byte[])call.arguments;
            write(data).subscribe(
                    () -> result.success(null),
                    throwable -> result.error("WRITE_ERROR", throwable.getMessage(), null)
            );
        } else if (call.method.equals("startUpdates")) {
            startUpdates().subscribe(
                    () -> result.success(null),
                    throwable -> result.error("START_UPDATES_ERROR", throwable.getMessage(), null)
            );
        } else if (call.method.equals("stopUpdates")) {
            stopUpdates();
            result.success(null);
        } else if (call.method.equals("getDescriptor")) {
            String id = (String)call.arguments;
            Guid guid = new Guid(id);
            BluetoothGattDescriptor d = nativeCharacteristic.getDescriptor(guid.toUUID());
            if(d != null) {
                result.success(Descriptor.toMap(d));
            } else {
                result.error("GET_DESCRIPTOR_ERROR", "Descriptor not found with id " + guid.toString(), null);
            }
        } else if (call.method.equals("getDescriptors")) {
            List<Map<String, Object>> res = new ArrayList<>();
            for(BluetoothGattDescriptor d : nativeCharacteristic.getDescriptors()) {
                res.add(Descriptor.toMap(d));
            }
            result.success(res);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public Map<String, Object> toMap() {
        Map<String, Object> m = new HashMap<>();
        m.put("id", this.guid.toString());
        m.put("name", this.name);
        m.put("properties", this.properties);
        m.put("writeType", this.writeType.ordinal());
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
