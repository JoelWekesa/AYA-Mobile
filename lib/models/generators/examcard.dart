// To parse this JSON data, do
//
//     final examCardGenModel = examCardGenModelFromJson(jsonString);

import 'dart:convert';

ExamCardGenModel examCardGenModelFromJson(String str) =>
    ExamCardGenModel.fromJson(json.decode(str));

String examCardGenModelToJson(ExamCardGenModel data) => json.encode(data.toJson());

class ExamCardGenModel {
  ExamCardGenModel({
    this.indexNumber,
    this.fullName,
    this.idNumber,
    this.examDates,
    this.papersApplied,
    this.school,
    this.examCenter,
  });

  String? indexNumber;
  String? fullName;
  String? idNumber;
  String? examDates;
  String? papersApplied;
  String? school;
  String? examCenter;

  factory ExamCardGenModel.fromJson(Map<String, dynamic> json) => ExamCardGenModel(
        indexNumber: json["index_number"],
        fullName: json["full_name"],
        idNumber: json["id_number"],
        examDates: json["exam_dates"],
        papersApplied: json["papers_applied"],
        school: json["school"],
        examCenter: json["exam_center"],
      );

  Map<String, dynamic> toJson() => {
        "index_number": indexNumber,
        "full_name": fullName,
        "id_number": idNumber,
        "exam_dates": examDates,
        "papers_applied": papersApplied,
        "school": school,
        "exam_center": examCenter,
      };
}
