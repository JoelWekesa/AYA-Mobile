// To parse this JSON data, do
//
//     final examResults = examResultsFromJson(jsonString);

import 'dart:convert';

List<ExamResults> examResultsFromJson(String str) => List<ExamResults>.from(
    json.decode(str).map((x) => ExamResults.fromJson(x)));

String examResultsToJson(List<ExamResults> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamResults {
  ExamResults({
    this.series,
    this.indexNumber,
    this.fullName,
    this.examNo,
    this.trainingInstitution,
    this.cadre,
    this.gradingMethod,
    this.scorePaperOne,
    this.scorePaperTwo,
    this.overallScore,
  });

  String? series;
  String? indexNumber;
  String? fullName;
  String? examNo;
  String? trainingInstitution;
  String? cadre;
  String? gradingMethod;
  String? scorePaperOne;
  String? scorePaperTwo;
  String? overallScore;

  factory ExamResults.fromJson(Map<String, dynamic> json) => ExamResults(
        series: json["series"],
        indexNumber: json["index_number"],
        fullName: json["full_name"],
        examNo: json["exam_no"],
        trainingInstitution: json["training_institution"],
        cadre: json["cadre"],
        gradingMethod: json["grading_method"],
        scorePaperOne: json["score_paper_one"],
        scorePaperTwo: json["score_paper_two"],
        overallScore: json["overall_score"],
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "index_number": indexNumber,
        "full_name": fullName,
        "exam_no": examNo,
        "training_institution": trainingInstitution,
        "cadre": cadre,
        "grading_method": gradingMethod,
        "score_paper_one": scorePaperOne,
        "score_paper_two": scorePaperTwo,
        "overall_score": overallScore,
      };
}
