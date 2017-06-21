package com.pauldemarco.flutterblue;

import java.util.List;
import java.util.Set;

import rx.Completable;
import rx.Observable;

/**
 * This should be the exact same interface as Dart
 * This shall be on the receiving end of the platform
 * (Dart) INTERFACE <---> CHANNEL <---> INTERFACE (Android)
 * This should not contain any Android Specific / RxAndroidBle code
 */

public abstract class Adapter {

    public abstract boolean isScanning();

    public abstract Observable<Device> deviceDiscovered();

    public abstract List<Device> getConnectedDevices();

    public abstract List<Device> getDiscoveredDevices();

    public abstract boolean startScanningForDevices(Set<Guid> serviceUuids);

    public abstract boolean stopScanningForDevices();

    public abstract Completable connectToDevice(Device device);

    public abstract Completable disconnectDevice(Device device);

    public abstract Completable connectToKnownDevice(Guid deviceGuid);

    public abstract List<Device> getSystemConnectedOrPairedDevices(Set<Guid> services);

}
