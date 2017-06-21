package com.pauldemarco.flutterblue;

import rx.Observable;
import rx.Single;

/**
 * Created by Paul on 6/15/2017.
 */

public abstract class BluetoothLe {

    final Adapter adapter;

    public BluetoothLe(Adapter adapter) {
        this.adapter = adapter;
    }

    public abstract Observable<BluetoothState> stateChanged();

    public abstract Single<BluetoothState> getState();

    public abstract boolean isAvailable();

    public abstract boolean isOn();

}
