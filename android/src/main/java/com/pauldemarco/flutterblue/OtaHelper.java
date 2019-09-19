package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import io.runtime.mcumgr.McuMgrTransport;
import io.runtime.mcumgr.ble.McuMgrBleTransport;
import io.runtime.mcumgr.dfu.FirmwareUpgradeCallback;
import io.runtime.mcumgr.dfu.FirmwareUpgradeController;
import io.runtime.mcumgr.dfu.FirmwareUpgradeManager;
import io.runtime.mcumgr.exception.McuMgrException;

public class OtaHelper implements FirmwareUpgradeCallback {

    FirmwareUpgradeManager dfuManager;
    int progress = 0;
    String errorString;

    void flash(BluetoothDevice device, byte[] firmware, Context context) {

        stopFlashing();
        progress = 0;

        McuMgrTransport transport = new McuMgrBleTransport(context, device);
        dfuManager = new FirmwareUpgradeManager(transport, null);

        dfuManager.setMode(FirmwareUpgradeManager.Mode.TEST_AND_CONFIRM);
        dfuManager.setFirmwareUpgradeCallback(this);

        try {
            dfuManager.start(firmware);
        } catch (Exception ignored) {}
    }

    boolean stopFlashing(){
        errorString = null;
        boolean wasStopped = false;
        if(dfuManager != null) {
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

    }

    @Override
    public void onUpgradeCompleted() {
        progress = 100;
    }

    @Override
    public void onUpgradeFailed(FirmwareUpgradeManager.State state, McuMgrException error) {
        errorString = error.toString();
        stopFlashing();
    }

    @Override
    public void onUpgradeCanceled(FirmwareUpgradeManager.State state) {

    }

    @Override
    public void onUploadProgressChanged(final int bytesSent, final int imageSize, final long timestamp) {
        // Converting to percent
        progress = ((int) (bytesSent * 100.f / imageSize));
    }
}
