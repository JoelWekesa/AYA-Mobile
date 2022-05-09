// To parse this JSON data, do
//
//     final examSeriesModel = examSeriesModelFromJson(jsonString);

import 'dart:convert';

List<ExamSeriesModel> examSeriesModelFromJson(String str) =>
    List<ExamSeriesModel>.from(json.decode(str).map((x) => ExamSeriesModel.fromJson(x)));

String examSeriesModelToJson(List<ExamSeriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamSeriesModel {
  ExamSeriesModel({
    this.studentSeriesId,
    this.examsSeries,
    this.cadre,
    this.applicationStatus,
  });

  String? studentSeriesId;
  String? examsSeries;
  String? cadre;
  String? applicationStatus;

  factory ExamSeriesModel.fromJson(Map<String, dynamic> json) => ExamSeriesModel(
        studentSeriesId: json["student_series_id"],
        examsSeries: json["exams_series"],
        cadre: json["cadre"],
        applicationStatus: json["application_status"],
      );

  Map<String, dynamic> toJson() => {
        "student_series_id": studentSeriesId,
        "exams_series": examsSeries,
        "cadre": cadre,
        "application_status": applicationStatus,
      };
}
