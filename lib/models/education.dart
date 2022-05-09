// To parse this JSON data, do
//
//     final educationModel = educationModelFromJson(jsonString);

import 'dart:convert';

List<EducationModel> educationModelFromJson(String str) =>
    List<EducationModel>.from(
        json.decode(str).map((x) => EducationModel.fromJson(x)));

String educationModelToJson(List<EducationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EducationModel {
  EducationModel({
    this.educationId,
    this.cadre,
    this.cadreText,
    this.institution,
    this.admissionDate,
    this.eligibleForInternship,
    this.eligibleForRegistration,
  });

  String? educationId;
  String? cadre;
  String? cadreText;
  String? institution;
  DateTime? admissionDate;
  String? eligibleForInternship;
  String? eligibleForRegistration;

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        educationId: json["education_id"],
        cadre: json["cadre"],
        cadreText: json["cadre_text"],
        institution: json["institution"],
        admissionDate: DateTime.parse(json["admission_date"]),
        eligibleForInternship: json["eligible_for_internship"],
        eligibleForRegistration: json["eligible_for_registration"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "cadre": cadre,
        "cadre_text": cadreText,
        "institution": institution,
        "admission_date":
            "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "eligible_for_internship": eligibleForInternship,
        "eligible_for_registration": eligibleForRegistration,
      };
}
