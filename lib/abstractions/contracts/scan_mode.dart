enum ScanMode {
  // Passively listen for Scan results.
  passive,

  // Perform Bluetooth LE scan in low power mode.
  lowPower,

  // Perform Bluetooth LE scan in balanced power mode. Scan results are returned at a rate that provides a good trade-off between scan frequency and power consumption.
  balanced,

  // Scan using highest duty cycle.
  lowLatency
}