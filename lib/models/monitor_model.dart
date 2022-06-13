// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

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
    log("timestamp: ${light.toString()}, temperature: ${temperature.toString()}, ");
    log("humidity: ${humidity.toString()}, moisture: ${moisture.toString()}, ");
    log("pH: ${pH.toString()}, light: ${light.toString()}");
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

class ActuatorModel {
  late String documentId;
  late num motorAcid;
  late num motorBase;
  late bool motorMain;
  late bool motorExhaust;
  late num light;

  ActuatorModel(
      {required this.documentId,
      required this.light,
      required this.motorAcid,
      required this.motorBase,
      required this.motorExhaust,
      required this.motorMain});

  ActuatorModel.fromRTDB({required DataSnapshot documentSnapshot}) {
    documentId = documentSnapshot.value.toString();
    // log("from model $documentId");
    motorAcid = documentSnapshot.child("motor_acid").value as num;
    motorBase = documentSnapshot.child("motor_base").value as num;
    motorExhaust = documentSnapshot.child("motor_ventilation").value as bool;
    motorMain = documentSnapshot.child("motor_main").value as bool;
    light = documentSnapshot.child("luminosity").value as num;
  }
}
