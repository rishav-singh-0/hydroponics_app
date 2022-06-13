import 'dart:developer';
import 'package:get/get.dart';
import '../services/firestore_db.dart';
import 'package:hydroponics_app/models/monitor_model.dart';

class ActuatorController extends GetxController {
  var isLoading = true.obs;
  Rx<List<ActuatorModel>> actuatorList = Rx<List<ActuatorModel>>([]);
  List<ActuatorModel> get actuators => actuatorList.value.obs;
  ActuatorModel get latestActuator {
    if (actuatorList.value.isEmpty) {
      return ActuatorModel(
          documentId: "documentId",
          light: 0,
          motorAcid: 0,
          motorBase: 0,
          motorExhaust: false,
          motorMain: false);
    }
    return actuatorList.value.last;
  }

  @override
  void onReady() {
    log("onReady method entered Actuator!!!");
    actuatorList.bindStream(FirebaseRTDB.getActuatorList());
    log("onReady method called Actuator!!!");
  }
}
