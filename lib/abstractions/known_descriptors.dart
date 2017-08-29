import 'package:flutter_blue/abstractions/known_descriptor.dart';
import 'package:guid/guid.dart';
import 'package:flutter_blue/abstractions/known_service.dart';

class KnownDescriptors {

  static final lookupTable = new Map<Guid, KnownDescriptor>.fromIterable(_descriptors, key: (i) => i.id);

  static KnownDescriptor lookup(Guid guid) {
    return lookupTable.containsKey(guid) ? lookupTable[guid] : new KnownDescriptor("Unknown descriptor", new Guid.empty());
  }

  static final _descriptors = [
    new KnownDescriptor("Characteristic Extended Properties", new Guid("00002900-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Characteristic User Description", new Guid("00002901-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Client Characteristic Configuration", new Guid("00002902-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Server Characteristic Configuration", new Guid("00002903-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Characteristic Presentation Format", new Guid("00002904-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Characteristic Aggregate Format", new Guid("00002905-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Valid Range", new Guid("00002906-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("External Report Reference", new Guid("00002907-0000-1000-8000-00805f9b34fb")),
    new KnownDescriptor("Export Reference", new Guid("00002908-0000-1000-8000-00805f9b34fb")),
  ];

}