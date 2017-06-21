package com.pauldemarco.flutterblue.concrete;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;

import com.pauldemarco.flutterblue.BluetoothLe;
import com.pauldemarco.flutterblue.BluetoothState;
import com.polidea.rxandroidble.RxBleAdapterStateObservable;
import com.polidea.rxandroidble.RxBleClient;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Observable;
import rx.Subscription;

/**
 * Created by paul on 6/20/17.
 */

public class BluetoothLeImpl extends BluetoothLe implements MethodCallHandler, StreamHandler {

    private final Activity activity;
    private final RxBleClient rxBleClient;
    private final MethodChannel methodChannel;
    private final EventChannel eventChannel;
    private final BluetoothAdapter bluetoothAdapter;
    private Subscription stateSubscription;


    public BluetoothLeImpl(Registrar registrar, RxBleClient rxBleClient, BluetoothAdapter bluetoothAdapter) {
        super(new AdapterImpl(registrar, rxBleClient, bluetoothAdapter));
        this.activity = registrar.activity();
        this.rxBleClient = rxBleClient;
        this.bluetoothAdapter = bluetoothAdapter;
        this.methodChannel = new MethodChannel(registrar.messenger(), "flutterblue.pauldemarco.com/bluetoothLe");
        this.eventChannel = new EventChannel(registrar.messenger(), "flutterblue.pauldemarco.com/bluetoothLe/state");
        this.methodChannel.setMethodCallHandler(this);
        this.eventChannel.setStreamHandler(this);
    }

    @Override
    public Observable<BluetoothState> stateChanged() {
        return new RxBleAdapterStateObservable(activity)
                .map(i -> toState(i));
    }

    @Override
    public BluetoothState getState() {
        if(bluetoothAdapter == null) {
            return BluetoothState.UNAVAILABLE;
        }

        return toState(bluetoothAdapter.getState());
    }

    @Override
    public boolean isAvailable() {
        if(bluetoothAdapter == null) {
            return false;
        }
        BluetoothState state = toState(bluetoothAdapter.getState());
        switch(state) {
            case OFF:
            case ON:
            case TURNING_OFF:
            case TURNING_ON:
                return true;
            default:
                return false;
        }
    }

    @Override
    public boolean isOn() {
        if(bluetoothAdapter == null) {
            return false;
        }
        return bluetoothAdapter.isEnabled();
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("isOn")) {
            result.success(isOn());
        } else if (call.method.equals("isAvailable")) {
            result.success(isAvailable());
        } else if (call.method.equals("getState")) {
            result.success(getState().ordinal());
        } else {
            result.notImplemented();
        }
    }

    private BluetoothState toState(RxBleAdapterStateObservable.BleAdapterState state) {
        if(state == RxBleAdapterStateObservable.BleAdapterState.STATE_ON) {
            return BluetoothState.ON;
        } else if(state == RxBleAdapterStateObservable.BleAdapterState.STATE_OFF) {
            return BluetoothState.OFF;
        } else if(state == RxBleAdapterStateObservable.BleAdapterState.STATE_TURNING_ON) {
            return BluetoothState.TURNING_ON;
        } else if(state == RxBleAdapterStateObservable.BleAdapterState.STATE_TURNING_OFF) {
            return BluetoothState.TURNING_OFF;
        } else {
            return BluetoothState.UNKNOWN;
        }
    }

    private BluetoothState toState(int state) {
        switch(state){
            case BluetoothAdapter.STATE_OFF:
                return BluetoothState.OFF;
            case BluetoothAdapter.STATE_ON:
                return BluetoothState.ON;
            case BluetoothAdapter.STATE_TURNING_OFF:
                return BluetoothState.TURNING_OFF;
            case BluetoothAdapter.STATE_TURNING_ON:
                return BluetoothState.TURNING_ON;
            default:
                return BluetoothState.UNKNOWN;
        }
    }

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        if(stateSubscription == null) {
            stateSubscription = stateChanged().subscribe(
                    s -> eventSink.success(s.ordinal()),
                    e -> eventSink.error("BLUETOOTH_STATE_ERROR", e.getMessage(), e)
            );
        }
    }

    @Override
    public void onCancel(Object o) {
        if(stateSubscription != null) {
            stateSubscription.unsubscribe();
            stateSubscription = null;
        }
    }
}
