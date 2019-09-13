package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.util.Log;

import org.jetbrains.annotations.NotNull;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import io.runtime.mcumgr.McuMgrTransport;
import io.runtime.mcumgr.ble.McuMgrBleTransport;
import io.runtime.mcumgr.dfu.FirmwareUpgradeManager;
import io.runtime.mcumgr.exception.McuMgrException;
import io.runtime.mcumgr.managers.ImageManager;

public class OtaHelper  implements ImageManager.ImageUploadCallback {

    FirmwareUpgradeManager dfuManager;
    int progress = 0;

    public static byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                    + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }

    boolean flash(BluetoothDevice device, String firmwarePath, Context context){

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
        boolean result = false;

        try {
            dfuManager.start(bytes);
            result = true;
        } catch (Exception ignored) {}
        return result;
    }

    @Override
    public void onProgressChanged(int bytesSent, int imageSize, long timestamp) {
        Log.d("PLUGIN", "Flashing progress: " + bytesSent * 100.f / imageSize);
        progress = (int) (bytesSent * 100.f / imageSize);
    }

    @Override
    public void onUploadFailed(@NotNull McuMgrException error) {

    }

    @Override
    public void onUploadCanceled() {

    }

    @Override
    public void onUploadFinished() {
        progress = 100;
    }
}
