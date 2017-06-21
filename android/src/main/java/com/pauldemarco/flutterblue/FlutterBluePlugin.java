package com.pauldemarco.flutterblue;

import android.bluetooth.BluetoothAdapter;

import com.pauldemarco.flutterblue.concrete.BluetoothLeImpl;
import com.polidea.rxandroidble.RxBleClient;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterBluePlugin
 */
public class FlutterBluePlugin {
  private final Registrar registrar;
  private final BluetoothLe bluetoothLe;

  

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {

    final FlutterBluePlugin instance = new FlutterBluePlugin(registrar);

  }

  FlutterBluePlugin(Registrar r){
    this.registrar = r;
    RxBleClient rxBleClient = RxBleClient.create(r.activity());
    BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
    this.bluetoothLe = new BluetoothLeImpl(r, rxBleClient, adapter);
  }


}
