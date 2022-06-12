import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'initializers.dart';
import '../models/monitor_model.dart';

class FirestoreDb {
  static Stream<List<MonitorModel>> monitorStream() {
    return firebaseFirestore
        .collection('monitor')
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

// class FirestoreDb {
//   static Stream<List<MonitorModel>> monitorStream() {
//     List<MonitorModel> monitors = [];
//     return firebaseFirestore.collection("monitor").snapshots().map((event) {
//       for (var document in event.docs) {
//         final monitorModel = MonitorModel.fromMap(data: document.data());
//         monitors.add(monitorModel);
//       }
//       return monitorModel;
//     });
//   }
// }
