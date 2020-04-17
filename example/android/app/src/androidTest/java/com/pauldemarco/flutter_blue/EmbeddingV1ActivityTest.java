 package io.flutter.plugins.firebase.core;

 import androidx.test.rule.ActivityTestRule;
 import dev.flutter.plugins.e2e.FlutterRunner;
 import com.pauldemarco.flutter_blue_example.EmbeddingV1Activity;
 import org.junit.Rule;
 import org.junit.runner.RunWith;

 @RunWith(FlutterRunner.class)
 public class EmbeddingV1ActivityTest {
   @Rule
   public ActivityTestRule<EmbeddingV1Activity> rule =
       new ActivityTestRule<>(EmbeddingV1Activity.class);
 }