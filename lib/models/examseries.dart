// To parse this JSON data, do
//
//     final examSeries = examSeriesFromJson(jsonString);

import 'dart:convert';

List<ExamSeries> examSeriesFromJson(String str) =>
    List<ExamSeries>.from(json.decode(str).map((x) => ExamSeries.fromJson(x)));

String examSeriesToJson(List<ExamSeries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamSeries {
  ExamSeries({
    this.studentSeriesId,
    this.examsSeries,
    this.cadre,
    this.applicationStatus,
  });

  String? studentSeriesId;
  String? examsSeries;
  String? cadre;
  String? applicationStatus;

  factory ExamSeries.fromJson(Map<String, dynamic> json) => ExamSeries(
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
