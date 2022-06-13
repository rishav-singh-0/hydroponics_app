import 'package:get/get.dart';
import '../services/firestore_db.dart';
import 'package:hydroponics_app/models/monitor_model.dart';

class ActuatorController extends GetxController {
  final actuatorList = ActuatorModel(
          documentId: "documentId",
          light: 0,
          motorAcid: 0,
          motorBase: 0,
          motorExhaust: false,
          motorMain: false)
      .obs;

  void updateActuator() {
    FirebaseRTDB.updateActuatorList(actuatorList.value);
    update();
  }

  @override
  void onReady() {
    actuatorList.bindStream(FirebaseRTDB.getActuatorList());
  }

  @override
  void onClose() {
    actuatorList.close();
  }
}
