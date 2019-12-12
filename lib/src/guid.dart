// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class Guid {
  final List<int> _bytes;
  final int _hashCode;

  Guid._internal(List<int> bytes)
      : _bytes = bytes,
        _hashCode = _calcHashCode(bytes);

  Guid(String input) : this._internal(_fromString(input));

  Guid.fromMac(String input) : this._internal(_fromMacString(input));

  Guid.empty() : this._internal(new List.filled(16, 0));

  static List<int> _fromMacString(String input) {
    if (input == null) {
      throw new ArgumentError("Input was null");
    }

    input = _removeNonHexCharacters(input);
    final bytes = hex.decode(input);

    if (bytes.length != 6) {
      throw new FormatException("The format is invalid: " + input);
    }

    return bytes + List<int>.filled(10, 0);
  }

  static List<int> _fromString(String input) {
    if (input == null) {
      throw new ArgumentError("Input was null");
    }

    input = _removeNonHexCharacters(input);
    final bytes = hex.decode(input);

    if (bytes.length != 16) {
      throw new FormatException("The format is invalid");
    }

    return bytes;
  }

  static String _removeNonHexCharacters(String sourceString) {
    return String.fromCharCodes(sourceString.runes.where((r) =>
      (r >= 48 && r <= 57) // characters 0 to 9
      || (r >= 65 && r <= 70)  // characters A to F
      || (r >= 97 && r <= 102) // characters a to f
    ));
  }

  static int _calcHashCode(List<int> bytes) {
    const equality = const ListEquality<int>();
    return equality.hash(bytes);
  }

  @override
  String toString() {
    String one = hex.encode(_bytes.sublist(0, 4));
    String two = hex.encode(_bytes.sublist(4, 6));
    String three = hex.encode(_bytes.sublist(6, 8));
    String four = hex.encode(_bytes.sublist(8, 10));
    String five = hex.encode(_bytes.sublist(10, 16));
    return "$one-$two-$three-$four-$five";
  }

  String toMac() {
    String one = hex.encode(_bytes.sublist(0, 1));
    String two = hex.encode(_bytes.sublist(1, 2));
    String three = hex.encode(_bytes.sublist(2, 3));
    String four = hex.encode(_bytes.sublist(3, 4));
    String five = hex.encode(_bytes.sublist(4, 5));
    String six = hex.encode(_bytes.sublist(5, 6));
    return "$one:$two:$three:$four:$five:$six".toUpperCase();
  }

  List<int> toByteArray() {
    return _bytes;
  }

  operator ==(other) => other is Guid && this.hashCode == other.hashCode;

  int get hashCode => _hashCode;
}
