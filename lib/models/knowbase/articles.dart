// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'dart:convert';

List<ArticlesModel> articlesModelFromJson(String str) =>
    List<ArticlesModel>.from(json.decode(str).map((x) => ArticlesModel.fromJson(x)));

String articlesModelToJson(List<ArticlesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticlesModel {
  ArticlesModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
