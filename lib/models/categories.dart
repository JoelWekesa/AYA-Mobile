// To parse this JSON data, do

import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.categoryId,
    this.category,
  });

  String? categoryId;
  String? category;

  factory Categories.fromJson(Map<String?, dynamic> json) => Categories(
        categoryId: json["category_id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category": category,
      };
}
