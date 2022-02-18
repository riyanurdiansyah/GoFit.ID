import 'dart:convert';

LapanganM lapanganMFromJson(String str) => LapanganM.fromJson(json.decode(str));

class LapanganM {
  LapanganM({
    this.createdAt,
    this.updatedAt,
    this.booking,
    this.category,
    this.dp,
    this.idMitra,
    this.price,
    this.priceWeekend,
    this.image,
    this.categoryName,
    this.name,
    this.lapangan,
    this.rating,
    this.id,
  });

  String? createdAt;
  String? updatedAt;
  int? booking;
  int? category;
  bool? dp;
  String? idMitra;
  int? price;
  int? priceWeekend;
  List<dynamic>? image;
  String? categoryName;
  String? name;
  int? lapangan;
  double? rating;
  String? id;

  factory LapanganM.fromJson(Map<String, dynamic> json) => LapanganM(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        booking: json["booking"],
        category: json["category"],
        dp: json["dp"],
        idMitra: json["idMitra"],
        price: json["price"],
        priceWeekend: json["priceWeekend"],
        image: json["image"],
        categoryName: json["categoryName"],
        name: json["name"],
        lapangan: json["lapangan"],
        rating: json["rating"],
        id: json["id"],
      );
}
