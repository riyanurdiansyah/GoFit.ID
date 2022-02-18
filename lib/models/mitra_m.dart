import 'dart:convert';

MitraM mitraMFromJson(String str) => MitraM.fromJson(json.decode(str));

String mitraMToJson(MitraM data) => json.encode(data.toJson());

class MitraM {
  MitraM({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.instagram,
    this.logo,
    this.rating,
    this.totalTrip,
    this.submission,
    this.document,
    this.status,
    this.favorite,
  });

  String? createdAt;
  String? document;
  List<dynamic>? favorite;
  String? id;
  String? instagram;
  String? logo;
  String? name;
  double? rating;
  bool? status;
  int? submission;
  int? totalTrip;
  String? updatedAt;

  factory MitraM.fromJson(Map<String, dynamic> json) => MitraM(
        createdAt: json["createdAt"],
        document: json["document"],
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        id: json["id"],
        instagram: json["instagram"],
        logo: json["logo"],
        name: json["name"],
        rating: json["rating"].toDouble(),
        status: json["status"],
        submission: json["submission"],
        totalTrip: json["totalTrip"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!,
        "updatedAt": updatedAt!,
        "id": id,
        "name": name,
        "instagram": instagram,
        "logo": logo,
        "rating": rating,
        "totalTrip": totalTrip,
        "submission": submission,
        "document": document,
        "status": status,
        "favorite": List<dynamic>.from(favorite!.map((x) => x)),
      };
}
