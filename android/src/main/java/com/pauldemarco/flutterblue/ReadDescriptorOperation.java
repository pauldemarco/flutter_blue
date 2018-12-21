// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothGattDescriptor;
import io.flutter.plugin.common.MethodChannel.Result;
import com.google.protobuf.ByteString;

public class ReadDescriptorOperation extends GattOperation {

    private BluetoothGattDescriptor descriptor;

    public ReadDescriptorOperation(BluetoothGatt g, BluetoothGattDescriptor d, Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
        descriptor = d;
    }

    public void execute() {
        if(!mGattServer.readDescriptor(descriptor)) {
            mResult.error("read_descriptor_error", "unknown reason, may occur if readDescriptor was called before last read finished.", null);
            finished();
        }
    }

    @Override
    public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        // Rebuild the ReadAttributeRequest and send back along with response
        Protos.ReadDescriptorRequest.Builder q = Protos.ReadDescriptorRequest.newBuilder();
        q.setRemoteId(gatt.getDevice().getAddress());
        q.setCharacteristicUuid(descriptor.getCharacteristic().getUuid().toString());
        q.setDescriptorUuid(descriptor.getUuid().toString());
        if(descriptor.getCharacteristic().getService().getType() == BluetoothGattService.SERVICE_TYPE_PRIMARY) {
            q.setServiceUuid(descriptor.getCharacteristic().getService().getUuid().toString());
        } else {
            // Reverse search to find service
            for(BluetoothGattService s : gatt.getServices()) {
                for(BluetoothGattService ss : s.getIncludedServices()) {
                    if(ss.getUuid().equals(descriptor.getCharacteristic().getService().getUuid())){
                        q.setServiceUuid(s.getUuid().toString());
                        q.setSecondaryServiceUuid(ss.getUuid().toString());
                        break;
                    }
                }
            }
        }

        Protos.ReadDescriptorResponse.Builder p = Protos.ReadDescriptorResponse.newBuilder();
        p.setRequest(q);
        p.setValue(ByteString.copyFrom(descriptor.getValue()));
        mResult.success(p.build().toByteArray());

        finished();
    }
}
