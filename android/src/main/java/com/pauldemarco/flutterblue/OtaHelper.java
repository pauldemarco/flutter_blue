package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothDevice;
import android.content.Context;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import io.runtime.mcumgr.McuMgrTransport;
import io.runtime.mcumgr.ble.McuMgrBleTransport;
import io.runtime.mcumgr.dfu.FirmwareUpgradeCallback;
import io.runtime.mcumgr.dfu.FirmwareUpgradeController;
import io.runtime.mcumgr.dfu.FirmwareUpgradeManager;
import io.runtime.mcumgr.exception.McuMgrException;

public class OtaHelper implements FirmwareUpgradeCallback {

    FirmwareUpgradeManager dfuManager;
    int progress = 0;

    boolean flash(BluetoothDevice device, String firmwarePath, Context context) {

        progress = 0;
        McuMgrTransport transport = new McuMgrBleTransport(context, device);
        dfuManager = new FirmwareUpgradeManager(transport, null);

        File file = new File(firmwarePath);
        int size = (int) file.length();
        byte[] bytes = new byte[size];
        try {
            BufferedInputStream buf = new BufferedInputStream(new FileInputStream(file));
            buf.read(bytes, 0, bytes.length);
            buf.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        dfuManager.setMode(FirmwareUpgradeManager.Mode.TEST_AND_CONFIRM);
        dfuManager.setFirmwareUpgradeCallback(this);
        boolean result = false;

        try {
            dfuManager.start(bytes);
            result = true;
        } catch (Exception ignored) {
        }
        return result;
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

    }

    @Override
    public void onUpgradeCanceled(FirmwareUpgradeManager.State state) {

    }

    @Override
    public void onUploadProgressChanged(final int bytesSent, final int imageSize, final long timestamp) {
        // Convert to percent
        progress = ((int) (bytesSent * 100.f / imageSize));
    }
}
