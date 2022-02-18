class BookingM {
  BookingM({
    this.date,
    this.idMitra,
    this.idPenyewa,
    this.lapangan,
    this.time,
    this.id,
  });

  String? date;
  String? lapangan;
  String? idMitra;
  String? idPenyewa;
  int? time;
  String? id;

  factory BookingM.fromJson(Map<String, dynamic> json) => BookingM(
        date: json["date"],
        lapangan: json["lapangan"],
        idMitra: json["idMitra"],
        time: json["time"],
        id: json["id"],
      );
}
