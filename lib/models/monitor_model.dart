// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
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
      required this.pH,
      timestamp});

  factory MonitorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MonitorModel(
      temperature: data?['temperature'],
      humidity: data?['humidity'],
      moisture: data?['moisture'],
      light: data?['light'],
      pH: data?['pH'],
      timestamp: data?['time_stamp'],
    );
  }

  MonitorModel.fromMap({required Map<String, dynamic> data}) {
    log("testing");
    log(data.toString());
    data.entries.forEach((element) {
      log("${element.key}: ${element.value}");
      switch (element.key) {
        case "temperature":
          {
            temperature = element.value;
          }
          break;
        case "luminocity":
          {
            light = element.value;
          }
          break;
        case "humidity":
          {
            humidity = element.value;
          }
          break;
        case "pH":
          {
            pH = element.value;
          }
          break;
        case "time_stamp":
          {
            timestamp = element.value;
          }
          break;
        case "moisture":
          {
            moisture = element.value;
          }
          break;
      }
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (temperature != null) "temperature": temperature,
      if (humidity != null) "humidity": humidity,
      if (moisture != null) "moisture": moisture,
      if (light != null) "light": light,
      if (pH != null) "pH": pH,
      if (timestamp != null) "time_stamp": timestamp,
    };
  }

  MonitorModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    temperature = documentSnapshot["temperature"];
    humidity = documentSnapshot["humidity"];
    light = documentSnapshot["light"];
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
