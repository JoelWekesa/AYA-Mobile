// To parse this JSON data, do
//
//     final counties = countiesFromJson(jsonString);

import 'dart:convert';

List<Counties> countiesFromJson(String str) =>
    List<Counties>.from(json.decode(str).map((x) => Counties.fromJson(x)));

String countiesToJson(List<Counties> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Counties {
  Counties({
    this.id,
    this.county,
  });

  String? id;
  String? county;

  factory Counties.fromJson(Map<String, dynamic> json) => Counties(
        id: json["id"],
        county: json["County"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "County": county,
      };
}
