package com.pauldemarco.flutterblue.concrete;

import com.pauldemarco.flutterblue.Adapter;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;

import java.util.List;
import java.util.Set;

import rx.Completable;

/**
 * Created by paul on 6/20/17.
 */

public class AdapterImpl extends Adapter {
    @Override
    public boolean isScanning() {
        return false;
    }

    @Override
    public List<Device> getConnectedDevices() {
        return null;
    }

    @Override
    public List<Device> getDiscoveredDevices() {
        return null;
    }

    @Override
    public Completable startScanningForDevices(Set<Guid> serviceUuids) {
        return null;
    }

    @Override
    public Completable stopScanningForDevices() {
        return null;
    }

    @Override
    public Completable connectToDevice(Device device) {
        return null;
    }

    @Override
    public Completable disconnectDevice(Device device) {
        return null;
    }

    @Override
    public Completable connectToKnownDevice(Guid deviceGuid) {
        return null;
    }

    @Override
    public List<Device> getSystemConnectedOrPairedDevices(Set<Guid> services) {
        return null;
    }
}
