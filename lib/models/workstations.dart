// To parse this JSON data, do
//
//     final workStations = workStationsFromJson(jsonString);

import 'dart:convert';

List<WorkStations> workStationsFromJson(String str) => List<WorkStations>.from(
    json.decode(str).map((x) => WorkStations.fromJson(x)));

String workStationsToJson(List<WorkStations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkStations {
  WorkStations({
    this.id,
    this.workstation,
  });

  String? id;
  String? workstation;

  factory WorkStations.fromJson(Map<String, dynamic> json) => WorkStations(
        id: json["id"],
        workstation: json["workstation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workstation": workstation,
      };
}
