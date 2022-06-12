import 'dart:developer';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_db.dart';
import 'package:hydroponics_app/models/monitor_model.dart';
import '../services/initializers.dart';

class MonitorController extends GetxController {
  Rx<List<MonitorModel>> monitorList = Rx<List<MonitorModel>>([]);
  List<MonitorModel> get monitors => monitorList.value;

  @override
  void onReady() {
    monitorList.bindStream(FirestoreDb.monitorStream());
    log("onReady method called !!!");
  }
}
