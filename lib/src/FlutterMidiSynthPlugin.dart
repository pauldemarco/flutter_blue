part of flutter_blue;

class FlutterMidiSynthPlugin {
  //static const MethodChannel _channel = const MethodChannel('FlutterMidiSynthPlugin');
  static const MethodChannel _channel = const MethodChannel('$NAMESPACE/methods');

  static Future<void> initSynth(int i) async {
    return _channel.invokeMethod('initSynth',i);
  }

  static Future<void> setInstrument(int instrument, int channel, int bank, String mac) async {
    return _channel.invokeMethod('setInstrument',{'channel':channel, 'instrument':instrument, 'bank':bank , 'mac':mac});
  }

  static Future<void> noteOn(int channel, int note, int velocity) async {
    return _channel.invokeMethod('noteOn', {'channel':channel, 'note':note, 'velocity':velocity} );
  }

  static Future<void> noteOff(int channel, int note, int velocity) async {
    return _channel.invokeMethod('noteOff', {'channel':channel, 'note':note, 'velocity':velocity} );
  }

  static Future<void> midiEvent(int cmd, int d1, int d2) async {
    return _channel.invokeMethod('midiEvent', {'command':cmd, 'd1':d1, 'd2':d2} );
  }

  static Future<void> setReverb(double amount) async {
    return _channel.invokeMethod('setReverb', amount );
  }

  static Future<void> setDelay(double amount) async {
    return _channel.invokeMethod('setDelay', amount );
  }
}
