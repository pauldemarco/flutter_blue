import 'package:convert/convert.dart';

class Guid {

  final List<int> _bytes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

  Guid(String input) {
    if(input == null){
      throw new ArgumentError("Input was null");
    }
    if(input.length < 32){
      throw new FormatException("The format is invalid");
    }
    input = input.toLowerCase();

    final RegExp regex = new RegExp('[0-9a-f]{2}');
    Iterable<Match> matches = regex.allMatches(input);
    if(matches.length != 16){
      throw new FormatException("The format is invalid");
    }
    int i = 0;
    for(Match match in matches) {
      var hexString = input.substring(match.start,match.end);
      _bytes[i] = hex.decode(hexString)[0];
      i++;
    }
  }

  Guid.fromMac(String input) {
    if(input == null){
      throw new ArgumentError("Input was null");
    }
    input = input.toLowerCase();

    final RegExp regex = new RegExp('[0-9a-f]{2}');
    Iterable<Match> matches = regex.allMatches(input);

    if(matches.length != 6){
      throw new FormatException("The format is invalid: " + input);
    }

    int i = 0;
    for(Match match in matches) {
      var hexString = input.substring(match.start,match.end);
      _bytes[i] = hex.decode(hexString)[0];
      i++;
    }

  }

  Guid.empty(){
    for(int i=0; i < _bytes.length; i++) {
      _bytes[i] = 0;
    }
  }

  bool operator ==(o) {
    if(o is Guid){
      for(int i=0; i < _bytes.length; i++) {
        if(_bytes.length != o._bytes.length) {
          return false;
        }
        if(_bytes[i] != o._bytes[i]){
          return false;
        }
      }
    }
    return true;
  }


  @override
  String toString() {
    String one = hex.encode(_bytes.sublist(0,4));
    String two = hex.encode(_bytes.sublist(4,6));
    String three = hex.encode(_bytes.sublist(6,8));
    String four = hex.encode(_bytes.sublist(8,10));
    String five = hex.encode(_bytes.sublist(10,16));
    return "$one-$two-$three-$four-$five";
  }

  List<int> toByteArray() {
    return _bytes;
  }

}