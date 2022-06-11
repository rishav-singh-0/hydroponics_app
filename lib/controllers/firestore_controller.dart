import 'package:get/get.dart';
import 'package:hydroponics_app/models/monitor_model.dart';
import '../services/firestore_db.dart';

class MonitorController extends GetxController {
  Rx<List<MonitorModel>> monitorList = Rx<List<MonitorModel>>([]);
  List<MonitorModel> get monitors => monitorList.value;

  @override
  void onReady() {
    monitorList.bindStream(FirestoreDb.monitorStream());
  }
}
