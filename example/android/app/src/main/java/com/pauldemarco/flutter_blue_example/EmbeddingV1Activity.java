package com.pauldemarco.flutter_blue_example;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import com.pauldemarco.flutter_blue.FlutterBluePlugin;

public class EmbeddingV1Activity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    FlutterBluePlugin.registerWith(registrarFor("com.pauldemarco.flutter_blue.FlutterBluePlugin"));
  }
}
