// To parse this JSON data, do
//
//     final rotationsGet = rotationsGetFromJson(jsonString);

import 'dart:convert';

List<RotationsGet> rotationsGetFromJson(String str) => List<RotationsGet>.from(
    json.decode(str).map((x) => RotationsGet.fromJson(x)));

String rotationsGetToJson(List<RotationsGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RotationsGet {
  RotationsGet({
    this.rotationActivityId,
    this.internshipCenter,
    this.internshipAreaId,
    this.internshipArea,
    this.rotationAreaId,
    this.rotationArea,
    this.competencyId,
    this.competency,
    this.activityNotes,
    this.activityDate,
  });

  String? rotationActivityId;
  String? internshipCenter;
  String? internshipAreaId;
  InternshipArea? internshipArea;
  String? rotationAreaId;
  RotationArea? rotationArea;
  String? competencyId;
  String? competency;
  String? activityNotes;
  DateTime? activityDate;

  factory RotationsGet.fromJson(Map<String, dynamic> json) => RotationsGet(
        rotationActivityId: json["rotation_activity_id"],
        internshipCenter: json["internship_center"],
        internshipAreaId: json["internship_area_id"],
        internshipArea: internshipAreaValues.map[json["internship_area"]],
        rotationAreaId: json["rotation_area_id"],
        rotationArea: rotationAreaValues.map[json["rotation_area"]],
        competencyId: json["competency_id"],
        competency: json["competency"],
        activityNotes: json["activity_notes"],
        activityDate: DateTime.parse(json["activity_date"]),
      );

  Map<String, dynamic> toJson() => {
        "rotation_activity_id": rotationActivityId,
        "internship_center": internshipCenter,
        "internship_area_id": internshipAreaId,
        "internship_area": internshipAreaValues.reverse[internshipArea],
        "rotation_area_id": rotationAreaId,
        "rotation_area": rotationAreaValues.reverse[rotationArea],
        "competency_id": competencyId,
        "competency": competency,
        "activity_notes": activityNotes,
        "activity_date": activityDate?.toIso8601String(),
      };
}

enum InternshipArea { GENERAL_NURSING }

final internshipAreaValues =
    EnumValues({"GENERAL NURSING": InternshipArea.GENERAL_NURSING});

enum RotationArea {
  MEDICAL_NURSING,
  CASUALTY_OPD,
  INTENSIVE_CARE_NURSING,
  SURGICAL_NURSING,
  THEATRE_NURSING
}

final rotationAreaValues = EnumValues({
  "Casualty/OPD": RotationArea.CASUALTY_OPD,
  "Intensive care nursing": RotationArea.INTENSIVE_CARE_NURSING,
  "Medical nursing": RotationArea.MEDICAL_NURSING,
  "Surgical nursing": RotationArea.SURGICAL_NURSING,
  "Theatre nursing": RotationArea.THEATRE_NURSING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
