import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:e2e/e2e.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Is bluetooth available?', (WidgetTester tester) async {
    final FlutterBlue blue = FlutterBlue.instance;
    final bool isAvail = await blue.isAvailable;
    expect(isAvail, true);
  });
}
