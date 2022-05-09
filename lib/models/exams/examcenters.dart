// To parse this JSON data, do
//
//     final examCentersModel = examCentersModelFromJson(jsonString);

import 'dart:convert';

List<ExamCentersModel> examCentersModelFromJson(String str) =>
    List<ExamCentersModel>.from(json.decode(str).map((x) => ExamCentersModel.fromJson(x)));

String examCentersModelToJson(List<ExamCentersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamCentersModel {
  ExamCentersModel({
    this.examCenterId,
    this.examCenter,
  });

  String? examCenterId;
  String? examCenter;

  factory ExamCentersModel.fromJson(Map<String, dynamic> json) => ExamCentersModel(
        examCenterId: json["exam_center_id"],
        examCenter: json["exam_center"],
      );

  Map<String, dynamic> toJson() => {
        "exam_center_id": examCenterId,
        "exam_center": examCenter,
      };
}
