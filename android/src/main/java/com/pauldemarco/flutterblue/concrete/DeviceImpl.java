package com.pauldemarco.flutterblue.concrete;

import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.DeviceState;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;
import com.polidea.rxandroidble.RxBleConnection;
import com.polidea.rxandroidble.RxBleDevice;
import com.polidea.rxandroidble.RxBleScanResult;

import java.util.List;

import rx.Single;

/**
 * Created by paul on 6/21/17.
 */

public class DeviceImpl extends Device {

    public static Device fromScanResult(RxBleScanResult scanResult) {
        int rssi = scanResult.getRssi();
        String mac = scanResult.getBleDevice().getMacAddress();
        Guid guid = Guid.fromMac(mac);
        String name = scanResult.getBleDevice().getName();

        Device device = new DeviceImpl(guid, name, rssi, scanResult.getBleDevice(), scanResult.getScanRecord());
        return device;
    }

    public DeviceImpl(Guid guid, String name, int rssi, RxBleDevice nativeDevice, byte[] advPacket) {
        super(guid, name, rssi, nativeDevice, advPacket);
        state = toState(nativeDevice.getConnectionState());
    }

    @Override
    public Single<List<Service>> getServices() {
        return null;
    }

    @Override
    public Single<Service> getService(Guid id) {
        return null;
    }

    @Override
    public Single<Boolean> updateRssi() {
        return null;
    }

    @Override
    public Single<Integer> requestMtu(int requestValue) {
        return null;
    }

    private DeviceState toState(RxBleConnection.RxBleConnectionState state) {
        // TODO: Where is the LIMITED case?
        switch(state) {
            case DISCONNECTED:
                return DeviceState.DISCONNECTED;
            case CONNECTING:
                return DeviceState.CONNECTING;
            case CONNECTED:
                return DeviceState.CONNECTED;
            case DISCONNECTING:
                return DeviceState.DISCONNECTED;
            default:
                return DeviceState.DISCONNECTED;
        }
    }
}
