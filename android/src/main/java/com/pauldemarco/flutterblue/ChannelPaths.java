package com.pauldemarco.flutterblue;

/**
 * Created by paul on 6/26/17.
 */

public class ChannelPaths {

    public final static String ROOT = "flutterblue.pauldemarco.com/";

    public final static String BLUETOOTHLE =  ROOT + "bluetoothLe/";
    public final static String BLUETOOTHLE_METHODS =  BLUETOOTHLE + "methods";
    public final static String BLUETOOTHLE_STATE =  BLUETOOTHLE + "state";

    public final static String ADAPTER = ROOT + "adapter/";
    public final static String ADAPTER_METHODS = ADAPTER + "methods";
    public final static String ADAPTER_DEVICE_DISCOVERED = ADAPTER + "deviceDiscovered";
    public final static String ADAPTER_DEVICE_CONNECTED = ADAPTER + "deviceConnected";

    public final static String DEVICES = ROOT + "devices/";
    public final static String getDevicePath(String id){
        return DEVICES + id + "/";
    }
    public final static String getDeviceMethodsPath(String id){
        return getDevicePath(id) + "methods";
    }
    public final static String getDeviceStatusPath(String id){
        return getDevicePath(id) + "status";
    }

    public final static String SERVICES = "services/";
    public final static String getServicePath(String deviceId, String serviceId){
        return getDevicePath(deviceId) + SERVICES + serviceId + "/";
    }
    public final static String getServiceMethodsPath(String deviceId, String serviceId){
        return getServicePath(deviceId, serviceId) + "methods";
    }
}
