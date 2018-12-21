// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import io.flutter.plugin.common.MethodChannel.Result;

import java.util.UUID;

public class SetNotificationOperation extends GattOperation {
    static final private UUID CCCD_ID = UUID.fromString("000002902-0000-1000-8000-00805f9b34fb");

    private BluetoothGattCharacteristic characteristic;
    private boolean enable;

    public SetNotificationOperation(BluetoothGatt g, BluetoothGattCharacteristic c, boolean e, Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
        characteristic = c;
        enable = e;
    }

    public void execute() {
        BluetoothGattDescriptor cccDescriptor;
        try {
            cccDescriptor = characteristic.getDescriptor(CCCD_ID);
            if(cccDescriptor == null) {
                throw new Exception("could not locate CCCD descriptor for characteristic: " +characteristic.getUuid().toString());
            }
        } catch(Exception e) {
            mResult.error("set_notification_error", e.getMessage(), null);
            finished();
            return;
        }

        byte[] value = null;

        if(enable) {
            boolean canNotify = (characteristic.getProperties() & BluetoothGattCharacteristic.PROPERTY_NOTIFY) > 0;
            boolean canIndicate = (characteristic.getProperties() & BluetoothGattCharacteristic.PROPERTY_INDICATE) > 0;
            if(!canIndicate && !canNotify) {
                mResult.error("set_notification_error", "the characteristic cannot notify or indicate", null);
                finished();
                return;
            }
            if(canIndicate) {
                value = BluetoothGattDescriptor.ENABLE_INDICATION_VALUE;
            }
            if(canNotify) {
                value = BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE;
            }
        } else {
            value = BluetoothGattDescriptor.DISABLE_NOTIFICATION_VALUE;
        }


        if(!cccDescriptor.setValue(value)) {
            mResult.error("set_notification_error", "error when setting the descriptor value to: " + value, null);
            finished();
            return;
        }

        if(!mGattServer.setCharacteristicNotification(characteristic, enable)){
            mResult.error("set_notification_error", "could not set characteristic notifications to :" + enable, null);
            finished();
            return;
        }

        if(!mGattServer.writeDescriptor(cccDescriptor)) {
            mResult.error("set_notification_error", "error when writing the descriptor", null);
            finished();
            return;
        }
    }

    @Override
    public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        mResult.success(ProtoMaker.from(characteristic, mGattServer).toByteArray());
        finished();
    }
}
