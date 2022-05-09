// To parse this JSON data, do
//
//     final workstationByCounty = workstationByCountyFromJson(jsonString);

import 'dart:convert';

List<WorkstationByCounty> workstationByCountyFromJson(String str) => List<WorkstationByCounty>.from(json.decode(str).map((x) => WorkstationByCounty.fromJson(x)));

String workstationByCountyToJson(List<WorkstationByCounty> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkstationByCounty {
    WorkstationByCounty({
        this.id,
        this.workstation,
    });

    String? id;
    String? workstation;

    factory WorkstationByCounty.fromJson(Map<String, dynamic> json) => WorkstationByCounty(
        id: json["id"],
        workstation: json["workstation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "workstation": workstation,
    };
}
