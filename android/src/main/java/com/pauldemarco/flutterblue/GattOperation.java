// Copyright 2018, Daniel Turing.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;

import io.flutter.plugin.common.MethodChannel.Result;


// TODO: timeout.
public abstract class GattOperation extends BluetoothGattCallback {
    protected BluetoothGatt mGattServer;
    protected Result mResult;
    protected FinishedCallback mFinishedCallback;

    public interface FinishedCallback {
        void onGattOperationFinished();
    }

    public GattOperation(BluetoothGatt g, Result r, FinishedCallback f) {
        mGattServer = g;
        mResult = r;
        mFinishedCallback = f;
    }

    public abstract void execute();

    public void finished() {
        if (mFinishedCallback!=null) mFinishedCallback.onGattOperationFinished();
    }

    @Override
    public void onConnectionStateChange(BluetoothGatt gatt, int status, int newState) {
        mResult.error("invalid_reply", "unexpected onConnectionStateChange", null);
    }

    @Override
    public void onServicesDiscovered(BluetoothGatt gatt, int status) {
        mResult.error("invalid_reply", "unexpected onServicesDiscovered", null);
    }

    @Override
    public void onCharacteristicRead(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        mResult.error("invalid_reply", "unexpected onCharacteristicRead", null);
    }

    @Override
    public void onCharacteristicWrite(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic, int status) {
        mResult.error("invalid_reply", "unexpected onCharacteristicWrite", null);
    }

    @Override
    public void onCharacteristicChanged(BluetoothGatt gatt, BluetoothGattCharacteristic characteristic) {
        mResult.error("invalid_reply", "unexpected onCharacteristicChanged", null);
    }

    @Override
    public void onDescriptorRead(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        mResult.error("invalid_reply", "unexpected onDescriptorRead", null);
    }

    @Override
    public void onDescriptorWrite(BluetoothGatt gatt, BluetoothGattDescriptor descriptor, int status) {
        mResult.error("invalid_reply", "unexpected onDescriptorWrite", null);
    }

    @Override
    public void onReliableWriteCompleted(BluetoothGatt gatt, int status) {
        mResult.error("invalid_reply", "unexpected onReliableWriteCompleted", null);
    }

    @Override
    public void onReadRemoteRssi(BluetoothGatt gatt, int rssi, int status) {
        mResult.error("invalid_reply", "unexpected onReadRemoteRssi", null);
    }

    @Override
    public void onMtuChanged(BluetoothGatt gatt, int mtu, int status) {
        mResult.error("invalid_reply", "unexpected onMtuChanged", null);
    }
}
