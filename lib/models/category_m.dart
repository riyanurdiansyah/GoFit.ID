import 'dart:convert';

CategoryM categoryMFromJson(String str) => CategoryM.fromJson(json.decode(str));

class CategoryM {
  CategoryM({
    this.category,
    this.categoryName,
  });
  int? category;
  String? categoryName;

  factory CategoryM.fromJson(Map<String, dynamic> json) => CategoryM(
        category: json["category"],
        categoryName: json["categoryName"],
      );
}
