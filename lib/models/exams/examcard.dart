// To parse this JSON data, do
//
//     final examCardModel = examCardModelFromJson(jsonString);

import 'dart:convert';

List<ExamCardModel> examCardModelFromJson(String str) =>
    List<ExamCardModel>.from(json.decode(str).map((x) => ExamCardModel.fromJson(x)));

String examCardModelToJson(List<ExamCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamCardModel {
  ExamCardModel({
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

  factory ExamCardModel.fromJson(Map<String, dynamic> json) => ExamCardModel(
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
