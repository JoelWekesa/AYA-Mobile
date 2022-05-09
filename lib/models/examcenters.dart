// To parse this JSON data, do
//
//     final examCenters = examCentersFromJson(jsonString);

import 'dart:convert';

List<ExamCenters> examCentersFromJson(String str) => List<ExamCenters>.from(
    json.decode(str).map((x) => ExamCenters.fromJson(x)));

String examCentersToJson(List<ExamCenters> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamCenters {
  ExamCenters({
    this.examCenterId,
    this.examCenter,
  });

  String? examCenterId;
  String? examCenter;

  factory ExamCenters.fromJson(Map<String, dynamic> json) => ExamCenters(
        examCenterId: json["exam_center_id"],
        examCenter: json["exam_center"],
      );

  Map<String, dynamic> toJson() => {
        "exam_center_id": examCenterId,
        "exam_center": examCenter,
      };
}
