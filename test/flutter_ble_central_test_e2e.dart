import 'package:flutter_ble_central/flutter_ble_central.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e2e/e2e.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Is bluetooth available?', (WidgetTester tester) async {
    final FlutterBleCentral blue = FlutterBleCentral.instance;
    final bool isAvail = await blue.isAvailable;
    expect(isAvail, true);
  });
}
