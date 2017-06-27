package com.pauldemarco.flutterblue.concrete;

import android.bluetooth.BluetoothGattService;

import com.pauldemarco.flutterblue.Characteristic;
import com.pauldemarco.flutterblue.Device;
import com.pauldemarco.flutterblue.Guid;
import com.pauldemarco.flutterblue.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rx.Single;

/**
 * Created by paul on 6/26/17.
 */

public class ServiceImpl extends Service {


    public ServiceImpl(Guid guid, boolean isPrimary, Device device) {
        super(guid, isPrimary, device);
    }

    public ServiceImpl(BluetoothGattService service, Device device) {
        this(
                new Guid(service.getUuid()),
                service.getType()==BluetoothGattService.SERVICE_TYPE_PRIMARY,
                device
        );
    }

    @Override
    public Single<List<Service>> getIncludedServices() {
        return null;
    }

    @Override
    public Single<List<Characteristic>> getCharacteristics() {
        return null;
    }

    @Override
    public Single<Characteristic> getCharacteristic() {
        return null;
    }

    @Override
    public Map<String, Object> toMap() {
        Map<String, Object> m = new HashMap<>();
        m.put("id", this.guid.toString());
        m.put("isPrimary", this.isPrimary);
        m.put("device", this.device.toMap());
        // Serialize the list of included services
        List<Map<String, Object>> outServices = new ArrayList<>(includedServices.size());
        for(Service s : includedServices) {
            outServices.add(s.toMap());
        }
        m.put("includedServices", outServices);
        // Serialize the list of included characteristics
        /*List<Map<String, Object>> outCharacteristics = new ArrayList<>(characteristics.size());
        for(Characteristic c : characteristics) {
            outCharacteristics.add(c.toMap());
        }
        m.put("characteristics", outCharacteristics);*/
        return m;
    }
}
