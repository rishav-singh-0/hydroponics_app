import 'package:get/get.dart';
import 'package:hydroponics_app/models/monitor_model.dart';
import '../services/firestore_db.dart';

class MonitorController extends GetxController {
  Rx<List<MonitorModel>> todoList = Rx<List<MonitorModel>>([]);
  List<MonitorModel> get todos => todoList.value;

  @override
  void onReady() {
    todoList.bindStream(FirestoreDb.monitorStream());
  }
}
