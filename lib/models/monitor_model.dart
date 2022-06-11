import 'package:cloud_firestore/cloud_firestore.dart';

class MonitorModel {
  String? documentId;
  late num temperature;
  late num humidity;
  late int moisture;
  late int light;
  late num pH;
  late int timestamp;

  MonitorModel(
      {required this.temperature,
      required this.humidity,
      required this.light,
      required this.moisture,
      required this.pH});

  MonitorModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    temperature = documentSnapshot["temperature"];
    humidity = documentSnapshot["humidity"];
    light = documentSnapshot["light"];
    moisture = documentSnapshot["moisture"];
    pH = documentSnapshot["pH"];
    timestamp = documentSnapshot["timestamp"];
  }
}

class Actuator {
  String? documentId;
  late num motorAcid;
  late num motorBase;
  late bool motorMain;
  late bool motorExhaust;
  late num light;

  Actuator(
      {required this.light,
      required this.motorAcid,
      required this.motorBase,
      required this.motorExhaust,
      required this.motorMain});

  Actuator.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    motorAcid = documentSnapshot["motorAcid"];
    motorBase = documentSnapshot["motorBase"];
    motorExhaust = documentSnapshot["motorExhaust"];
    motorMain = documentSnapshot["motorMain"];
    light = documentSnapshot["light"];
  }
}
