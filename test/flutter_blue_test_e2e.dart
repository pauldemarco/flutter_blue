import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Is bluetooth available?', (WidgetTester tester) async {
    final FlutterBlue blue = FlutterBlue.instance;
    final bool isAvail = await blue.isAvailable;
    expect(isAvail, true);
  });
}
