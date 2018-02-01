// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCharacteristic;
import io.flutter.plugin.common.MethodChannel.Result;

public class ReadCharacteristicOperation extends GattOperation {

    private BluetoothGattCharacteristic characteristic;

    public ReadCharacteristicOperation(BluetoothGatt g, BluetoothGattCharacteristic c, Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
        characteristic = c;
    }

    public void execute() {
        if(!mGattServer.readCharacteristic(characteristic)) {
            mResult.error("read_characteristic_error", "Could not initiate request to read characteristic value.", null);
            finished();
        }
    }

    @Override
    public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        Protos.ReadCharacteristicResponse.Builder p = Protos.ReadCharacteristicResponse.newBuilder();
        p.setRemoteId(mGattServer.getDevice().getAddress());
        p.setCharacteristic(ProtoMaker.from(characteristic, mGattServer));
        mResult.success(p.build().toByteArray());

        finished();
    }
}
