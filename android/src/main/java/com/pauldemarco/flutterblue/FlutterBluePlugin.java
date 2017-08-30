package com.pauldemarco.flutterblue;

import android.annotation.TargetApi;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanResult;
import android.content.Context;
import android.os.Build;

import com.google.protobuf.InvalidProtocolBufferException;

import java.util.List;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin implements MethodCallHandler {
  private static final String NAMESPACE = "plugins.pauldemarco.com/flutter_blue";
  private final Registrar registrar;
  private final MethodChannel channel;
  private final EventChannel stateChannel;
  private final EventChannel scanResultChannel;
  private BluetoothAdapter mBluetoothAdapter;

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {
    final FlutterBluePlugin instance = new FlutterBluePlugin(registrar);
  }

  FlutterBluePlugin(Registrar r){
    this.registrar = r;
    this.channel = new MethodChannel(registrar.messenger(), NAMESPACE+"/methods");
    this.stateChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/state");
    this.scanResultChannel = new EventChannel(registrar.messenger(), NAMESPACE+"/scanResult");
    final BluetoothManager bluetoothManager =
            (BluetoothManager) r.activity().getSystemService(Context.BLUETOOTH_SERVICE);
    this.mBluetoothAdapter = bluetoothManager.getAdapter();
    channel.setMethodCallHandler(this);
    scanResultChannel.setStreamHandler(scanResultsHandler);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if(mBluetoothAdapter == null && !"isAvailable".equals(call.method)) {
      result.error("bluetooth_unavailable", "the device does not have bluetooth", null);
      return;
    }

    switch (call.method) {
      case "isAvailable":
      {
        result.success(mBluetoothAdapter != null);
        break;
      }

      case "isOn":
      {
        result.success(mBluetoothAdapter.isEnabled());
        break;
      }

      case "startScan":
      {
        // TODO: Request permission.
        byte[] data = call.arguments();
        Protos.ScanSettings request = null;
        try {
          request = Protos.ScanSettings.newBuilder().mergeFrom(data).build();
        } catch (InvalidProtocolBufferException e) {
          result.error("RuntimeException", e.getMessage(), e);
        }
        startScan(request);
        result.success(null);
        break;
      }

      case "stopScan":
      {
        stopScan();
        result.success(null);
        break;
      }

      default:
      {
        result.notImplemented();
        break;
      }
    }
  }

  private void startScan(Protos.ScanSettings settings) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      startScan21(settings);
    } else {
      startScan18(settings);
    }
  }

  private void stopScan() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      stopScan21();
    } else {
      stopScan18();
    }
  }

  private ScanCallback scanCallback21;

  @TargetApi(21)
  private ScanCallback getScanCallback21() {
    if(scanCallback21 == null){
      scanCallback21 = new ScanCallback() {

        @Override
        public void onScanResult(int callbackType, ScanResult result) {
          super.onScanResult(callbackType, result);
          Protos.ScanResult.Builder scanResult = Protos.ScanResult.newBuilder()
            .setRemoteId(result.getDevice().getAddress())
            .setName(result.getDevice().getName())
            .setRssi(result.getRssi());
          if(result.getScanRecord() != null) {
            scanResult.setAdvertisementData(AdvertisementParser.parse(result.getScanRecord().getBytes()));
          }
          if(scanResultsSink != null) {
            scanResultsSink.success(scanResult.build().toByteArray());
          }
        }

        @Override
        public void onBatchScanResults(List<ScanResult> results) {
          super.onBatchScanResults(results);

        }

        @Override
        public void onScanFailed(int errorCode) {
          super.onScanFailed(errorCode);
        }
      };
    }
    return scanCallback21;
  }

  @TargetApi(21)
  private void startScan21(Protos.ScanSettings settings) {
    mBluetoothAdapter.getBluetoothLeScanner().startScan(getScanCallback21());
  }

  @TargetApi(21)
  private void stopScan21() {
    mBluetoothAdapter.getBluetoothLeScanner().stopScan(getScanCallback21());
  }

  private BluetoothAdapter.LeScanCallback scanCallback18;

  private BluetoothAdapter.LeScanCallback getScanCallback18() {
    if(scanCallback18 == null) {
      scanCallback18 = new BluetoothAdapter.LeScanCallback() {
        @Override
        public void onLeScan(final BluetoothDevice bluetoothDevice, int rssi,
                             byte[] scanRecord) {
          Protos.ScanResult scanResult = Protos.ScanResult.newBuilder()
                  .setRemoteId(bluetoothDevice.getAddress())
                  .setName(bluetoothDevice.getName())
                  .setRssi(rssi)
                  .setAdvertisementData(AdvertisementParser.parse(scanRecord))
                  .build();
          if(scanResultsSink != null) {
            scanResultsSink.success(scanResult.toByteArray());
          }
        }
      };
    }
    return scanCallback18;
  }

  private void startScan18(Protos.ScanSettings settings) {
    mBluetoothAdapter.startLeScan(getScanCallback18());
  }

  private void stopScan18() {
    mBluetoothAdapter.stopLeScan(getScanCallback18());
  }

  private EventSink scanResultsSink;
  private final StreamHandler scanResultsHandler = new StreamHandler() {
    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
      scanResultsSink = eventSink;
    }

    @Override
    public void onCancel(Object o) {
      scanResultsSink = null;
    }
  };

}
