// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattService;
import io.flutter.plugin.common.MethodChannel.Result;

public class DiscoverServicesOperation extends GattOperation {

    public DiscoverServicesOperation(BluetoothGatt g,  Result r, GattOperation.FinishedCallback f) {
        super(g,r,f);
    }

    public void execute() {
        if(!mGattServer.discoverServices()) {
            mResult.error("discover_services_error", "unknown reason", null);
            finished();
        }
    }

    @Override
    public void onServicesDiscovered(BluetoothGatt gatt, int status) {
        Protos.DiscoverServicesResult.Builder p = Protos.DiscoverServicesResult.newBuilder();
        p.setRemoteId(mGattServer.getDevice().getAddress());
        for(BluetoothGattService s : mGattServer.getServices()) {
            p.addServices(ProtoMaker.from(mGattServer.getDevice(), s, mGattServer));
        }
        mResult.success(p.build().toByteArray());

        finished();
    }
}
