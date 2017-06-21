import 'dart:async';

class LineStream extends Stream<String> {
  Stream<String> _source;
  StreamSubscription<String> _subscription;
  StreamController<String> _controller;
  int _lineCount = 0;
  String _remainder = '';

  LineStream(Stream<String> source) : _source = source {
    _controller = new StreamController<String>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel);
  }

  int get lineCount => _lineCount;

  StreamSubscription<String> listen(void onData(String line),
      { void onError(Error error),
        void onDone(),
        bool cancelOnError }) {
    return _controller.stream.listen(onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError);
  }

  void _onListen() {
    _subscription = _source.listen(_onData,
        onError: _controller.addError,
        onDone: _onDone);
  }

  void _onCancel() {
    _subscription.cancel();
    _subscription = null;
  }

  void _onPause() {
    _subscription.pause();
  }

  void _onResume() {
    _subscription.resume();
  }

  void _onData(String input) {
    List<String> splits = input.split('\n');
    splits[0] = _remainder + splits[0];
    _remainder = splits.removeLast();
    _lineCount += splits.length;
    splits.forEach(_controller.add);
  }

  void _onDone() {
    if (!_remainder.isEmpty) _controller.add(_remainder);
    _controller.close();
  }
}