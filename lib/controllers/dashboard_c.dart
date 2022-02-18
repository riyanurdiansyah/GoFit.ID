import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futsal_app/models/lapangan_m.dart';
import 'package:get/get.dart';

class DashboardC extends GetxController {
  final List<LapanganM> _listLapangan = [];
  List<LapanganM> get listLapangan => _listLapangan;
  List<int> _listCategory = [];
  List<int> get listCategory => _listCategory;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamLapangan() {
    return FirebaseFirestore.instance.collection("/Lapangan").snapshots();
  }

  void saveLapangan(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    _listLapangan.clear();
    _listCategory.clear();
    for (var data in docs) {
      _listLapangan.add(LapanganM.fromJson(data.data()));
      _listCategory.add(data.data()['category']);
    }
    _listCategory = _listCategory.toSet().toList();
  }
}
