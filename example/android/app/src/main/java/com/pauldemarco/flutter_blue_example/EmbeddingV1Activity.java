package dev.steenbakker.flutter_ble_central_example;

import android.os.Bundle;
import dev.flutter.plugins.e2e.E2EPlugin;
import io.flutter.app.FlutterActivity;
import dev.steenbakker.flutter_ble_central.FlutterBleCentralPlugin;

public class EmbeddingV1Activity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    FlutterBleCentralPlugin.registerWith(registrarFor("dev.steenbakker.flutter_ble_central.FlutterBleCentralPlugin"));
    E2EPlugin.registerWith(registrarFor("dev.flutter.plugins.e2e.E2EPlugin"));
  }
}
