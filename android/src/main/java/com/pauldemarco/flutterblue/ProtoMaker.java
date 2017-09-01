// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;

import com.google.protobuf.ByteString;

import java.util.UUID;

/**
 * Created by paul on 8/31/17.
 */

public class ProtoMaker {

    private static final UUID CCCD_UUID = UUID.fromString("000002902-0000-1000-8000-00805f9b34fb");

    static Protos.BluetoothService from(BluetoothDevice device, BluetoothGattService service) {
        Protos.BluetoothService.Builder p = Protos.BluetoothService.newBuilder();
        p.setRemoteId(device.getAddress());
        p.setUuid(service.getUuid().toString());
        p.setIsPrimary(service.getType() == BluetoothGattService.SERVICE_TYPE_PRIMARY);
        for(BluetoothGattCharacteristic c : service.getCharacteristics()) {
            p.addCharacteristics(from(c));
        }
        for(BluetoothGattService s : service.getIncludedServices()) {
            p.addIncludedServices(from(device, s));
        }
        return p.build();
    }

    static Protos.BluetoothCharacteristic from(BluetoothGattCharacteristic characteristic) {
        Protos.BluetoothCharacteristic.Builder p = Protos.BluetoothCharacteristic.newBuilder();
        p.setUuid(characteristic.getUuid().toString());
        p.setServiceUuid(characteristic.getService().getUuid().toString());
        p.setProperties(from(characteristic.getProperties()));
        if(characteristic.getValue() != null)
            p.setValue(ByteString.copyFrom(characteristic.getValue()));
        for(BluetoothGattDescriptor d : characteristic.getDescriptors()) {
            p.addDescriptors(from(d));
            if(d.getUuid() == CCCD_UUID) {
                if(d.getValue() != null && d.getValue().length > 0 && (d.getValue()[0] == 1 || d.getValue()[0] == 2)){
                    p.setIsNotifying(true);
                }
            }
        }
        return p.build();
    }

    static Protos.BluetoothDescriptor from(BluetoothGattDescriptor descriptor) {
        Protos.BluetoothDescriptor.Builder p = Protos.BluetoothDescriptor.newBuilder();
        p.setUuid(descriptor.getUuid().toString());
        p.setCharacteristicUuid(descriptor.getCharacteristic().getUuid().toString());
        p.setServiceUuid(descriptor.getCharacteristic().getService().getUuid().toString());
        if(descriptor.getValue() != null)
            p.setValue(ByteString.copyFrom(descriptor.getValue()));
        return p.build();
    }

    static Protos.CharacteristicProperties from(int properties) {
        return Protos.CharacteristicProperties.newBuilder()
                .setBroadcast((properties & 1) != 0)
                .setRead((properties & 2) != 0)
                .setWriteWithoutResponse((properties & 4) != 0)
                .setWrite((properties & 8) != 0)
                .setNotify((properties & 16) != 0)
                .setIndicate((properties & 32) != 0)
                .setAuthenticatedSignedWrites((properties & 64) != 0)
                .setExtendedProperties((properties & 128) != 0)
                .setNotifyEncryptionRequired((properties & 256) != 0)
                .setIndicateEncryptionRequired((properties & 512) != 0)
                .build();
    }
}
