// To parse this JSON data, do
//
//     final subArticlesMode = subArticlesModeFromJson(jsonString);

import 'dart:convert';

List<SubArticlesMode> subArticlesModeFromJson(String str) =>
    List<SubArticlesMode>.from(json.decode(str).map((x) => SubArticlesMode.fromJson(x)));

String subArticlesModeToJson(List<SubArticlesMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubArticlesMode {
  SubArticlesMode({
    this.id,
    this.articleId,
    this.articleTitle,
    this.subarticleTitle,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? articleId;
  String? articleTitle;
  String? subarticleTitle;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SubArticlesMode.fromJson(Map<String, dynamic> json) => SubArticlesMode(
        id: json["id"],
        articleId: json["articleId"],
        articleTitle: json["articleTitle"],
        subarticleTitle: json["subarticleTitle"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "articleId": articleId,
        "articleTitle": articleTitle,
        "subarticleTitle": subarticleTitle,
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
