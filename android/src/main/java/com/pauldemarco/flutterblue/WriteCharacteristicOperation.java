// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCharacteristic;
import io.flutter.plugin.common.MethodChannel.Result;

public class WriteCharacteristicOperation extends GattOperation {

    private BluetoothGattCharacteristic characteristic;

    public WriteCharacteristicOperation(BluetoothGatt g, BluetoothGattCharacteristic c, Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
        characteristic = c;
    }

    public void execute() {
        if(!mGattServer.writeCharacteristic(characteristic)){
            mResult.error("write_characteristic_error", "Could not initiate request to wrtie characteristic value.", null);
            finished();
        }
    }

    @Override
    public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        Protos.WriteCharacteristicRequest.Builder request = Protos.WriteCharacteristicRequest.newBuilder();
        request.setRemoteId(gatt.getDevice().getAddress());
        request.setCharacteristicUuid(characteristic.getUuid().toString());
        request.setServiceUuid(characteristic.getService().getUuid().toString());
        Protos.WriteCharacteristicResponse.Builder p = Protos.WriteCharacteristicResponse.newBuilder();
        p.setRequest(request);
        p.setSuccess(status == BluetoothGatt.GATT_SUCCESS);

        mResult.success(p.build().toByteArray());

        finished();
    }
}
