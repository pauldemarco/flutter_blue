package com.pauldemarco.flutterblue;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;

import com.polidea.rxandroidble.RxBleAdapterStateObservable;
import com.polidea.rxandroidble.RxBleAdapterStateObservable.BleAdapterState;
import com.polidea.rxandroidble.RxBleClient;
import com.polidea.rxandroidble.RxBleConnection;
import com.polidea.rxandroidble.RxBleScanResult;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rx.Subscription;

/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin implements MethodCallHandler {
  private final Activity activity;
  private final RxBleClient rxBleClient;

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {

    // Initialize the plugin instance
    final FlutterBluePlugin instance = new FlutterBluePlugin(registrar.activity());

    // Setup any method and event channels
    final MethodChannel methodChannel = new MethodChannel(registrar.messenger(), "flutterblue.pauldemarco.com/methods");
    final EventChannel scanChannel = new EventChannel(registrar.messenger(), "flutterblue.pauldemarco.com/scanResults");
    final EventChannel bluetoothStateChannel = new EventChannel(registrar.messenger(), "flutterblue.pauldemarco.com/bluetoothState");


    // Set handlers for the channels
    methodChannel.setMethodCallHandler(instance);
    scanChannel.setStreamHandler(instance.scanResultsHandler);
    bluetoothStateChannel.setStreamHandler(instance.bluetoothStateHandler);
  }

  FlutterBluePlugin(Activity activity){
    this.activity = activity;
    this.rxBleClient = RxBleClient.create(activity);
  }

  Subscription scanSubscription;

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("startScanningForDevicesAsync")) {
      if(scanSubscription != null){
        result.success("SCANNING");
        return;
      }
      scanSubscription = rxBleClient.scanBleDevices()
              .subscribe(
                      rxBleScanResult -> {
                        onScanResult(rxBleScanResult);
                      },
                      throwable -> {
                        onScanError(throwable);
                      }
              );
      result.success("SCANNING");
    } else if (call.method.equals("stopScanningForDevicesAsync")) {
      if(scanSubscription != null) {
        scanSubscription.unsubscribe();
        scanSubscription = null;
      }
      result.success("NOT_SCANNING");
    } else {
      result.notImplemented();
    }
  }

  private EventSink scanResultsSink;
  private void onScanResult(RxBleScanResult result) {
    if(scanResultsSink != null) {
      scanResultsSink.success(fromScanResultToMap(result));
    }
  }
  private void onScanError(Throwable t) {
    if(scanResultsSink != null) {
      scanResultsSink.error("SCAN_ERROR", t.getMessage(), null);
    }
  }
  private Map<String, Object> fromScanResultToMap(RxBleScanResult result) {
    ChannelMap map = new ChannelMap();
    map.put("id", Guid.fromMac(result.getBleDevice().getMacAddress()).toString());
    map.put("name", result.getBleDevice().getName());
    map.put("rssi", result.getRssi());
    map.put("state", getIntFromState(result.getBleDevice().getConnectionState()));
    map.put("advPacket", result.getScanRecord());
    return map;
  }
  private int getIntFromState(RxBleConnection.RxBleConnectionState state) {
    // TODO: Where is the LIMITED case?
    switch(state) {
      case DISCONNECTED:
        return 0;
      case CONNECTING:
        return 1;
      case CONNECTED:
        return 2;
      case DISCONNECTING:
        return 0;
    }
    return 0;
  }
  private final StreamHandler scanResultsHandler = new StreamHandler() {

    @Override
    public void onListen(Object o, EventSink eventSink) {
      scanResultsSink = eventSink;
    }

    @Override
    public void onCancel(Object o) {
      scanResultsSink= null;
    }
  };

  private final StreamHandler bluetoothStateHandler = new StreamHandler() {
    Subscription scanSubscription;

    @Override
    public void onListen(Object o, EventSink eventSink) {
      monitorBluetoothState(eventSink);
    }

    @Override
    public void onCancel(Object o) {
      if(scanSubscription != null){
        scanSubscription.unsubscribe();
        scanSubscription = null;
      }
    }

    private void monitorBluetoothState(final EventSink events) {
      // Send current state
      BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
      events.success(intToInt(mBluetoothAdapter.getState()));

      scanSubscription = new RxBleAdapterStateObservable(activity)
              .map((i) -> stateToInt(i))
              .subscribe(
                      state -> {
                        events.success(state);
                      },
                      throwable -> {
                        events.error("BLUETOOTH_STATE_ERROR", throwable.getMessage(), null);
                      }
              );
    }

    private int stateToInt(BleAdapterState state) {
      if(state == BleAdapterState.STATE_ON) {
        return 4;
      } else if(state == BleAdapterState.STATE_OFF) {
        return 6;
      } else if(state == BleAdapterState.STATE_TURNING_ON) {
        return 3;
      } else if(state == BleAdapterState.STATE_TURNING_OFF) {
        return 5;
      } else {
        return 0;
      }
    }

    private int intToInt(int state) {
      switch(state){
        case BluetoothAdapter.STATE_OFF:
          return 6;
        case BluetoothAdapter.STATE_ON:
          return 4;
        case BluetoothAdapter.STATE_TURNING_OFF:
          return 5;
        case BluetoothAdapter.STATE_TURNING_ON:
          return 3;
        default:
          return 0;
      }
    }

  };
}
