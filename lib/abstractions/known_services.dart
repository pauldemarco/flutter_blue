import 'package:flutter_blue/utils/guid.dart';
import 'package:flutter_blue/abstractions/known_service.dart';

class KnownServices {

  static final lookupTable = new Map<Guid, KnownService>.fromIterable(_services, key: (i) => i.id);

  static KnownService lookup(Guid guid) {
    return lookupTable.containsKey(guid) ? lookupTable[guid] : new KnownService("Unknown service", new Guid.empty());
  }

  static final _services = [
    new KnownService("Alert Notification Service", new Guid("00001811-0000-1000-8000-00805f9b34fb")),
    new KnownService("Battery Service", new Guid("0000180f-0000-1000-8000-00805f9b34fb")),
    new KnownService("Blood Pressure", new Guid("00001810-0000-1000-8000-00805f9b34fb")),
    new KnownService("Current Time Service", new Guid("00001805-0000-1000-8000-00805f9b34fb")),
    new KnownService("Cycling Power", new Guid("00001818-0000-1000-8000-00805f9b34fb")),
    new KnownService("Cycling Speed and Cadence", new Guid("00001816-0000-1000-8000-00805f9b34fb")),
    new KnownService("Device Information", new Guid("0000180a-0000-1000-8000-00805f9b34fb")),
    new KnownService("Generic Access", new Guid("00001800-0000-1000-8000-00805f9b34fb")),
    new KnownService("Generic Attribute", new Guid("00001801-0000-1000-8000-00805f9b34fb")),
    new KnownService("Glucose", new Guid("00001808-0000-1000-8000-00805f9b34fb")),
    new KnownService("Health Thermometer", new Guid("00001809-0000-1000-8000-00805f9b34fb")),
    new KnownService("Heart Rate", new Guid("0000180d-0000-1000-8000-00805f9b34fb")),
    new KnownService("Human Interface Device", new Guid("00001812-0000-1000-8000-00805f9b34fb")),
    new KnownService("Immediate Alert", new Guid("00001802-0000-1000-8000-00805f9b34fb")),
    new KnownService("Link Loss", new Guid("00001803-0000-1000-8000-00805f9b34fb")),
    new KnownService("Location and Navigation", new Guid("00001819-0000-1000-8000-00805f9b34fb")),
    new KnownService("Next DST Change Service", new Guid("00001807-0000-1000-8000-00805f9b34fb")),
    new KnownService("Phone Alert Status Service", new Guid("0000180e-0000-1000-8000-00805f9b34fb")),
    new KnownService("Reference Time Update Service", new Guid("00001806-0000-1000-8000-00805f9b34fb")),
    new KnownService("Running Speed and Cadence", new Guid("00001814-0000-1000-8000-00805f9b34fb")),
    new KnownService("Scan Parameters", new Guid("00001813-0000-1000-8000-00805f9b34fb")),
    new KnownService("TX Power", new Guid("00001804-0000-1000-8000-00805f9b34fb")),
    new KnownService("TI SensorTag Smart Keys", new Guid("0000ffe0-0000-1000-8000-00805f9b34fb")),
    new KnownService("TI SensorTag Infrared Thermometer", new Guid("f000aa00-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Accelerometer", new Guid("f000aa10-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Humidity", new Guid("f000aa20-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Magnometer", new Guid("f000aa30-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Barometer", new Guid("f000aa40-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Gyroscope", new Guid("f000aa50-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Test", new Guid("f000aa60-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag Connection Control", new Guid("f000ccc0-0451-4000-b000-000000000000")),
    new KnownService("TI SensorTag OvertheAir Download", new Guid("f000ffc0-0451-4000-b000-000000000000")),
    new KnownService("TXRX_SERV_UUID RedBearLabs Biscuit Service", new Guid("713d0000-503e-4c75-ba94-3148f18d941e")),
  ];

}