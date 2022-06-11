import 'package:cloud_firestore/cloud_firestore.dart';
import 'initializers.dart';
import '../models/monitor_model.dart';

class FirestoreDb {
  static Stream<List<MonitorModel>> monitorStream() {
    return firebaseFirestore
        .collection('users')
        .snapshots()
        .map((QuerySnapshot query) {
      List<MonitorModel> monitors = [];
      for (var monitor in query.docs) {
        final monitorModel =
            MonitorModel.fromDocumentSnapshot(documentSnapshot: monitor);
        monitors.add(monitorModel);
      }
      return monitors;
    });
  }
}
