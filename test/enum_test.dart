import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';
import 'package:test/test.dart';

main() {
    test('enum', (){
      int state = 4;
      expect(state, BluetoothState.on.index);
    });
}