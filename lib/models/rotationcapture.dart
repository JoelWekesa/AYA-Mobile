// To parse this JSON data, do
//
//     final rotationCapture = rotationCaptureFromJson(jsonString);

import 'dart:convert';

RotationCapture rotationCaptureFromJson(String str) =>
    RotationCapture.fromJson(json.decode(str));

String rotationCaptureToJson(RotationCapture data) =>
    json.encode(data.toJson());

class RotationCapture {
  RotationCapture({
    this.internshipId,
    this.competencyId,
    this.activityNotes,
    this.activityDate,
  });

  String? internshipId;
  String? competencyId;
  String? activityNotes;
  DateTime? activityDate;

  factory RotationCapture.fromJson(Map<String, dynamic> json) =>
      RotationCapture(
        internshipId: json["internship_id"],
        competencyId: json["competency_id"],
        activityNotes: json["activity_notes"],
        activityDate: DateTime.parse(json["activity_date"]),
      );

  Map<String, dynamic> toJson() => {
        "internship_id": internshipId,
        "competency_id": competencyId,
        "activity_notes": activityNotes,
        "activity_date": activityDate!.toIso8601String(),
      };
}
