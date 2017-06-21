import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';
import 'package:flutter_blue/utils/lerp.dart';
import 'package:test/test.dart';

main() {
  test('simple', (){
    var min = 0.0;
    var max = 10.0;
    var value = 5.0;
    expect(inverseLerp(min,max,value), 0.5);
  });

  test('negatives', (){
    var min = -90.0;
    var max = -60.0;
    var value = -66.0;
    print(inverseLerp(min, max, value));
    print(inverseLerp(min, max, value).clamp(0.0,1.0));
    expect(inverseLerp(min,max,value), 0.8);
  });
}

