// To parse this JSON data, do
//
//     final internshipApply = internshipApplyFromJson(jsonString);

import 'dart:convert';

InternshipApply internshipApplyFromJson(String str) =>
    InternshipApply.fromJson(json.decode(str));

String internshipApplyToJson(InternshipApply data) =>
    json.encode(data.toJson());

class InternshipApply {
  InternshipApply({
    this.educationId,
    this.internshipCenter,
    this.startDate,
    this.degreeCert,
    this.postingLetter,
  });

  String? educationId;
  String? internshipCenter;
  DateTime? startDate;
  String? degreeCert;
  String? postingLetter;

  factory InternshipApply.fromJson(Map<String, dynamic> json) =>
      InternshipApply(
        educationId: json["education_id"],
        internshipCenter: json["internship_center"],
        startDate: DateTime.parse(json["start_date"]),
        degreeCert: json["degree_cert"],
        postingLetter: json["posting_letter"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "internship_center": internshipCenter,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "degree_cert": degreeCert,
        "posting_letter": postingLetter,
      };
}
