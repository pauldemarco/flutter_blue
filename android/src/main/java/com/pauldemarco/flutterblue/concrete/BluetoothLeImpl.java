package com.pauldemarco.flutterblue.concrete;

import android.app.Activity;

import com.pauldemarco.flutterblue.BluetoothLe;
import com.pauldemarco.flutterblue.BluetoothState;
import com.polidea.rxandroidble.RxBleClient;

import rx.Observable;
import rx.Single;

/**
 * Created by paul on 6/20/17.
 */

public class BluetoothLeImpl extends BluetoothLe {

    private final Activity activity;
    private final RxBleClient rxBleClient;

    public BluetoothLeImpl(Activity activity) {
        super(new AdapterImpl());
        this.activity = activity;
        this.rxBleClient = RxBleClient.create(activity);
    }

    @Override
    public Observable<BluetoothState> stateChanged() {
        return null;
    }

    @Override
    public Single<BluetoothState> getState() {
        return null;
    }

    @Override
    public boolean isAvailable() {
        return false;
    }

    @Override
    public boolean isOn() {
        return false;
    }
}
