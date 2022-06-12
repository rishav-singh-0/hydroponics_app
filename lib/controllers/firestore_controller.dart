import 'dart:developer';
import 'package:get/get.dart';
import '../services/firestore_db.dart';
import 'package:hydroponics_app/models/monitor_model.dart';

class MonitorController extends GetxController {
  var isLoading = true;
  Rx<List<MonitorModel>> monitorList = Rx<List<MonitorModel>>([]);
  List<MonitorModel> get monitors => monitorList.value;
  MonitorModel get latestMonitor {
    if (monitorList.value.isEmpty) {
      return MonitorModel(
          documentId: "documentId",
          temperature: 0,
          humidity: 0,
          light: 0,
          moisture: 0,
          pH: 0,
          timestamp: 0);
    }
    return monitorList.value.last;
  }

  @override
  void onReady() {
    log("onReady method entered !!!");
    monitorList.bindStream(FirestoreDb.monitorStream());
    // if (monitorList.value != null) {
    //   latestMonitor = monitorList.value.last;
    // }
    log("onReady method called !!!");
  }
}
