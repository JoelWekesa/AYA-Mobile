// To parse this JSON data, do
//
//     final internshipCentres = internshipCentresFromJson(jsonString);

import 'dart:convert';

InternshipCentres internshipCentresFromJson(String str) =>
    InternshipCentres.fromJson(json.decode(str));

String internshipCentresToJson(InternshipCentres data) =>
    json.encode(data.toJson());

class InternshipCentres {
  InternshipCentres({
    this.internshipCenters,
  });

  List<InternshipCenter>? internshipCenters;

  factory InternshipCentres.fromJson(Map<String, dynamic> json) =>
      InternshipCentres(
        internshipCenters: List<InternshipCenter>.from(
            json["internship_centers"]
                .map((x) => InternshipCenter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "internship_centers":
            List<dynamic>.from(internshipCenters!.map((x) => x.toJson())),
      };
}

class InternshipCenter {
  InternshipCenter({
    this.id,
    this.mflCode,
    this.internshipCenter,
  });

  String? id;
  String? mflCode;
  String? internshipCenter;

  factory InternshipCenter.fromJson(Map<String, dynamic> json) =>
      InternshipCenter(
        id: json["id"],
        mflCode: json["mfl_code"] == null ? null : json["mfl_code"],
        internshipCenter: json["internship_center"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mfl_code": mflCode == null ? null : mflCode,
        "internship_center": internshipCenter,
      };
}
