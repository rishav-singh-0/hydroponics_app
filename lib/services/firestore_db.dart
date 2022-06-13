import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'initializers.dart';
import '../models/monitor_model.dart';

class FirestoreDb {
  static Stream<List<MonitorModel>> monitorStream() {
    return firebaseFirestore
        .collection('monitor')
        .orderBy("time_stamp", descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MonitorModel> monitors = [];
      for (var monitor in query.docs) {
        // log("from db ${monitor.data()!["pH"]}");
        final monitorModel =
            MonitorModel.fromDocumentSnapshot(documentSnapshot: monitor);
        monitors.add(monitorModel);
      }
      // log(monitors.toString());
      return monitors;
    });
  }
}

class FirebaseRTDB {
  static Stream<ActuatorModel> getActuatorList() {
    // static getActuatorList() {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("test");
    final actuatorStream = dbRef.onValue;
    List<ActuatorModel> actuators = [];
    return actuatorStream.map((event) {
      // log("from db ${event.snapshot.child('motor_acid').value}");
      final DataSnapshot actuatorMap = event.snapshot;
      final actuatorModel =
          ActuatorModel.fromRTDB(documentSnapshot: actuatorMap);
      actuators.add(actuatorModel);
      // log("from db $actuatorModel");
      return actuatorModel;
    });
  }

  static void updateActuatorList(ActuatorModel actuatorModel) async {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("test");
    return await dbRef.update({
      "luminosity": actuatorModel.light,
      "motor_acid": actuatorModel.motorAcid,
      "motor_base": actuatorModel.motorBase,
      "motor_main": actuatorModel.motorMain,
      "motor_ventilation": actuatorModel.motorExhaust
    });
  }
}
