// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothGattDescriptor;
import io.flutter.plugin.common.MethodChannel.Result;
import com.google.protobuf.ByteString;

public class WriteDescriptorOperation extends GattOperation {

    private BluetoothGattDescriptor descriptor;

    public WriteDescriptorOperation(BluetoothGatt g, BluetoothGattDescriptor d, Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
        descriptor = d;
    }

    public void execute() {
        if(!mGattServer.writeDescriptor(descriptor)){
            mResult.error("write_descriptor_error", "writeCharacteristic failed", null);
            return;
        }
    }

    @Override
    public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        Protos.WriteDescriptorRequest.Builder request = Protos.WriteDescriptorRequest.newBuilder();
        request.setRemoteId(gatt.getDevice().getAddress());
        request.setDescriptorUuid(descriptor.getUuid().toString());
        request.setCharacteristicUuid(descriptor.getCharacteristic().getUuid().toString());
        request.setServiceUuid(descriptor.getCharacteristic().getService().getUuid().toString());
        Protos.WriteDescriptorResponse.Builder p = Protos.WriteDescriptorResponse.newBuilder();
        p.setRequest(request);
        p.setSuccess(status == BluetoothGatt.GATT_SUCCESS);
        mResult.success(p.build().toByteArray());

        finished();
    }
}
