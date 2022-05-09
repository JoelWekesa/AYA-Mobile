// To parse this JSON data, do
//
//     final faQsModel = faQsModelFromJson(jsonString);

import 'dart:convert';

List<FaQsModel> faQsModelFromJson(String str) =>
    List<FaQsModel>.from(json.decode(str).map((x) => FaQsModel.fromJson(x)));

String faQsModelToJson(List<FaQsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaQsModel {
  FaQsModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FaQsModel.fromJson(Map<String, dynamic> json) => FaQsModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
