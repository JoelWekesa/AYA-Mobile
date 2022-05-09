// To parse this JSON data, do
//
//     final examApply = examApplyFromJson(jsonString);

import 'dart:convert';

ExamApply examApplyFromJson(String str) => ExamApply.fromJson(json.decode(str));

String examApplyToJson(ExamApply data) => json.encode(data.toJson());

class ExamApply {
  ExamApply({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory ExamApply.fromJson(Map<String, dynamic> json) => ExamApply(
        status: json["status"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message!.toJson(),
      };
}

class Message {
  Message({
    this.studentSeriesId,
    this.indexId,
    this.examCenters,
    this.applicationDate,
  });

  String? studentSeriesId;
  String? indexId;
  String? examCenters;
  DateTime? applicationDate;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        studentSeriesId: json["student_series_id"],
        indexId: json["index_id"],
        examCenters: json["exam_centers"],
        applicationDate: DateTime.parse(json["application_date"]),
      );

  Map<String, dynamic> toJson() => {
        "student_series_id": studentSeriesId,
        "index_id": indexId,
        "exam_centers": examCenters,
        "application_date": applicationDate!.toIso8601String(),
      };
}
