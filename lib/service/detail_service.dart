import 'package:cloud_firestore/cloud_firestore.dart';

class DetailService {
  Stream<QuerySnapshot<Map<String, dynamic>>> streamBooking(String id) {
    return FirebaseFirestore.instance
        .collection("/Booking")
        .where("idLapangan", isEqualTo: id)
        .snapshots();
  }
}
