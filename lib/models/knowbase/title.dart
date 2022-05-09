// To parse this JSON data, do
//
//     final titleModel = titleModelFromJson(jsonString);

import 'dart:convert';

TitleModel titleModelFromJson(String str) => TitleModel.fromJson(json.decode(str));

String titleModelToJson(TitleModel data) => json.encode(data.toJson());

class TitleModel {
  TitleModel({
    this.id,
    this.title,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  String? title;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        id: json["id"],
        title: json["title"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "updatedAt": updatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
      };
}
