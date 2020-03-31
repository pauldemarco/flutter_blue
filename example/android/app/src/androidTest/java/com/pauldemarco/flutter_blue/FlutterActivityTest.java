 package io.flutter.plugins.firebase.core;

 import androidx.test.rule.ActivityTestRule;
 import dev.flutter.plugins.e2e.FlutterRunner;
 import org.junit.Rule;
 import org.junit.runner.RunWith;

 @RunWith(FlutterRunner.class)
 public class FlutterActivityTest {
   // Replace `MainActivity` with `io.flutter.embedding.android.FlutterActivity` if you removed `MainActivity`.
   @Rule public ActivityTestRule<io.flutter.embedding.android.FlutterActivity> rule = new ActivityTestRule<>(io.flutter.embedding.android.FlutterActivity.class);
 }