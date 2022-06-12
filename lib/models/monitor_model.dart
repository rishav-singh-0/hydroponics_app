// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class MonitorModel {
  late String documentId;
  late num temperature;
  late num humidity;
  late int moisture;
  late int light;
  late num pH;
  late int timestamp;

  MonitorModel(
      {required this.documentId,
      required this.temperature,
      required this.humidity,
      required this.light,
      required this.moisture,
      required this.pH,
      required this.timestamp});

  logValues() {
    log("timestamp: ${light.toString()}, temperature: ${temperature.toString()}, humidity: ${humidity.toString()}, moisture: ${moisture.toString()}, pH: ${pH.toString()}, light: ${light.toString()}");
  }

  MonitorModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.data().toString();
    // log("from model $documentId");
    temperature = documentSnapshot["tempreture"];
    humidity = documentSnapshot["humidity"];
    light = documentSnapshot["luminocity"];
    moisture = documentSnapshot["moisture"];
    pH = documentSnapshot["pH"];
    timestamp = documentSnapshot["time_stamp"];
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
    motorAcid = documentSnapshot["motor_acid"];
    motorBase = documentSnapshot["motor_base"];
    motorExhaust = documentSnapshot["motor_ventilation"];
    motorMain = documentSnapshot["motor_main"];
    light = documentSnapshot["luminosity"];
  }
}
