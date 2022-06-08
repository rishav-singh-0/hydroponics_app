class Monitor {
  final int id;
  final num temperature;
  final num humidity;
  final int moisture;
  final int light;
  final num pH;

  Monitor(
      {required this.id,
      required this.temperature,
      required this.humidity,
      required this.light,
      required this.moisture,
      required this.pH});
}

class Actuator {
  final int id;
  final num motorAcid;
  final num motorBase;
  final bool motorMain;
  final bool motorExhaust;
  final num light;

  Actuator(
      {required this.id,
      required this.light,
      required this.motorAcid,
      required this.motorBase,
      required this.motorExhaust,
      required this.motorMain});
}
