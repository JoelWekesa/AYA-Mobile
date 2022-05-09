// To parse this JSON data, do
//
//     final kbaseModel = kbaseModelFromJson(jsonString);

import 'dart:convert';

List<KbaseModel> kbaseModelFromJson(String str) =>
    List<KbaseModel>.from(json.decode(str).map((x) => KbaseModel.fromJson(x)));

String kbaseModelToJson(List<KbaseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KbaseModel {
  KbaseModel({
    this.id,
    this.title,
    this.subtitle,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? subtitle;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory KbaseModel.fromJson(Map<String, dynamic> json) => KbaseModel(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
