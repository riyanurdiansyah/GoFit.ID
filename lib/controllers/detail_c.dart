import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futsal_app/models/booking_m.dart';
import 'package:get/get.dart';

class DetailC extends GetxController {
  var indexIndicator = 0.obs;
  final RxList<DateTime> _dates = <DateTime>[].obs;
  RxList<DateTime> get dates => _dates;
  final Rx<DateTime> _selectedDate = DateTime.now().obs;
  Rx<DateTime> get selectedDate => _selectedDate;

  final RxList<BookingM> _listBooking = <BookingM>[].obs;
  RxList<BookingM> get listBooking => _listBooking;
  final RxList<BookingM> _listBookingTemp = <BookingM>[].obs;
  RxList<BookingM> get listBookingTemp => _listBookingTemp;
  final RxList<int> _listTime = <int>[].obs;
  RxList<int> get listTime => _listTime;

  final Rx<int> _selectedTime = 00.obs;
  Rx<int> get selectedTime => _selectedTime;
  @override
  void onInit() {
    super.onInit();
    generateDate();
  }

  void swipeImage(int index) {
    indexIndicator.value = index;
  }

  void generateDate() {
    dates.value =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate.value = dates[0];
  }

  void onTapDate(DateTime date) {
    _selectedDate.value = date;
    _listBooking.value = _listBookingTemp
        .where((e) => DateTime.parse(e.date!).day == date.day)
        .toList();
  }

  void onTapTime(int time) {
    _selectedTime.value = time;
  }

  void saveLapangan(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    _listBookingTemp.clear();
    _listTime.clear();
    for (var data in docs) {
      _listBookingTemp.add(BookingM.fromJson(data.data()));
      _listTime.add(data.data()['time']);
    }
    _listBooking.value = _listBookingTemp;
    _listTime.sort((a, b) => a.compareTo(b));
  }
}
