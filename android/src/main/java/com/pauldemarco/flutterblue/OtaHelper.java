package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothDevice;
import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.EventChannel;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.subjects.PublishSubject;
import io.runtime.mcumgr.McuMgrCallback;
import io.runtime.mcumgr.McuMgrTransport;
import io.runtime.mcumgr.ble.McuMgrBleTransport;
import io.runtime.mcumgr.dfu.FirmwareUpgradeCallback;
import io.runtime.mcumgr.dfu.FirmwareUpgradeController;
import io.runtime.mcumgr.dfu.FirmwareUpgradeManager;
import io.runtime.mcumgr.exception.McuMgrException;
import io.runtime.mcumgr.managers.DefaultManager;
import io.runtime.mcumgr.response.McuMgrResponse;

public class OtaHelper implements FirmwareUpgradeCallback {

    FirmwareUpgradeManager dfuManager;
    DefaultManager defaultManager;
    int progress = 0;
    String errorString;

    private PublishSubject<Integer> progressSubject = PublishSubject.create();
    final EventChannel.StreamHandler firmwareProgressHandler = new EventChannel.StreamHandler() {
        private EventChannel.EventSink sink;

        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            sink = eventSink;
            progressSubject.subscribe(new Observer<Integer>() {

                @Override
                public void onSubscribe(Disposable d) {
                }

                @Override
                public void onNext(Integer value) {
                    sink.success(value);
                }

                @Override
                public void onError(Throwable e) {
                }

                @Override
                public void onComplete() {
                }
            });
        }

        @Override
        public void onCancel(Object o) {
            sink = null;
        }
    };

    private PublishSubject<String> stateSubject = PublishSubject.create();
    final EventChannel.StreamHandler firmwareStateHandler = new EventChannel.StreamHandler() {
        private EventChannel.EventSink sink;

        @Override
        public void onListen(Object o, EventChannel.EventSink eventSink) {
            sink = eventSink;
            stateSubject.subscribe(new Observer<String>() {

                @Override
                public void onSubscribe(Disposable d) { }

                @Override
                public void onNext(String value) {
                    sink.success(value);
                }

                @Override
                public void onError(Throwable e) { }

                @Override
                public void onComplete() { }
            });
        }

        @Override
        public void onCancel(Object o) {
            sink = null;
        }
    };

    void flash(BluetoothDevice device, byte[] firmware, Context context) {

        stopFlashing();
        progress = 0;

        McuMgrTransport transport = new McuMgrBleTransport(context, device);
        defaultManager = new DefaultManager(transport);
        dfuManager = new FirmwareUpgradeManager(transport, null);

        dfuManager.setMode(FirmwareUpgradeManager.Mode.TEST_AND_CONFIRM);
        dfuManager.setFirmwareUpgradeCallback(this);

        try {
            dfuManager.start(firmware);
        } catch (Exception ignored) {
        }
    }

    void reset(Context context, BluetoothDevice device) {
        if (defaultManager == null) {
            if (context == null || device == null) {
                return;
            }
            McuMgrTransport transport = new McuMgrBleTransport(context, device);
            defaultManager = new DefaultManager(transport);
        }
        defaultManager.reset(new McuMgrCallback<McuMgrResponse>() {
            @Override
            public void onResponse(@NonNull final McuMgrResponse response) {
                defaultManager.getTransporter().addObserver(new McuMgrTransport.ConnectionObserver() {
                    @Override
                    public void onConnected() {
                    }

                    @Override
                    public void onDisconnected() {
                        defaultManager.getTransporter().removeObserver(this);
                    }
                });
            }

            @Override
            public void onError(@NonNull final McuMgrException error) {

            }
        });
    }

    boolean stopFlashing() {
        errorString = null;
        boolean wasStopped = false;
        if (dfuManager != null) {
            if (dfuManager.isInProgress()) {
                dfuManager.cancel();
                wasStopped = true;
            }
        }
        return wasStopped;
    }

    @Override
    public void onUpgradeStarted(FirmwareUpgradeController controller) {

    }

    @Override
    public void onStateChanged(FirmwareUpgradeManager.State prevState, FirmwareUpgradeManager.State newState) {
        stateSubject.onNext(newState.name());
    }

    @Override
    public void onUpgradeCompleted() {
        stateSubject.onNext("Upgrade completed");
        progress = 100;
    }

    @Override
    public void onUpgradeFailed(FirmwareUpgradeManager.State state, McuMgrException error) {
        errorString = error.toString();
        stateSubject.onNext(errorString);
        stopFlashing();
    }

    @Override
    public void onUpgradeCanceled(FirmwareUpgradeManager.State state) {
        stateSubject.onNext(state.name());
    }

    @Override
    public void onUploadProgressChanged(final int bytesSent, final int imageSize, final long timestamp) {
        // Converting to percent
        progress = ((int) (bytesSent * 100.f / imageSize));
        progressSubject.onNext(progress);
    }
}
