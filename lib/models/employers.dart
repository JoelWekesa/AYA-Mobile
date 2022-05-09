// To parse this JSON data, do
//
//     final employers = employersFromJson(jsonString);

import 'dart:convert';

List<Employers> employersFromJson(String str) =>
    List<Employers>.from(json.decode(str).map((x) => Employers.fromJson(x)));

String employersToJson(List<Employers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employers {
  Employers({
    this.id,
    this.employer,
  });

  String? id;
  String? employer;

  factory Employers.fromJson(Map<String, dynamic> json) => Employers(
        id: json["id"],
        employer: json["employer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employer": employer,
      };
}
