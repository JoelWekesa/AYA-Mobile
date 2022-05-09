// To parse this JSON data, do
//
//     final internshipGet = internshipGetFromJson(jsonString);

import 'dart:convert';

List<InternshipGet> internshipGetFromJson(String str) =>
    List<InternshipGet>.from(
        json.decode(str).map((x) => InternshipGet.fromJson(x)));

String internshipGetToJson(List<InternshipGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InternshipGet {
  InternshipGet({
    this.internshipId,
    this.educationId,
    this.internshipCode,
    this.cadre,
    this.cadreDesc,
    this.internshipCenter,
    this.applicationDate,
    this.startDate,
    this.degreeCert,
    this.postingLetter,
    this.invoiceNo,
    this.amountDue,
    this.amountPaid,
    this.balanceDue,
    this.applicationStatus,
  });

  String? internshipId;
  String? educationId;
  dynamic internshipCode;
  Cadre? cadre;
  CadreDesc? cadreDesc;
  String? internshipCenter;
  DateTime? applicationDate;
  DateTime? startDate;
  String? degreeCert;
  String? postingLetter;
  String? invoiceNo;
  String? amountDue;
  String? amountPaid;
  String? balanceDue;
  ApplicationStatus? applicationStatus;

  factory InternshipGet.fromJson(Map<String, dynamic> json) => InternshipGet(
        internshipId: json["internship_id"],
        educationId: json["education_id"],
        internshipCode: json["internship_code"],
        cadre: cadreValues.map[json["cadre"]],
        cadreDesc: cadreDescValues.map[json["cadre_desc"]],
        internshipCenter: json["internship_center"],
        applicationDate: DateTime.parse(json["application_date"]),
        startDate: DateTime.parse(json["start_date"]),
        degreeCert: json["degree_cert"],
        postingLetter: json["posting_letter"],
        invoiceNo: json["invoice_no"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        balanceDue: json["balance_due"],
        applicationStatus:
            applicationStatusValues.map[json["application_status"]],
      );

  Map<String, dynamic> toJson() => {
        "internship_id": internshipId,
        "education_id": educationId,
        "internship_code": internshipCode,
        "cadre": cadreValues.reverse[cadre],
        "cadre_desc": cadreDescValues.reverse[cadreDesc],
        "internship_center": internshipCenter,
        "application_date": applicationDate?.toIso8601String(),
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "degree_cert": degreeCert,
        "posting_letter": postingLetter,
        "invoice_no": invoiceNo,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "balance_due": balanceDue,
        "application_status":
            applicationStatusValues.reverse[applicationStatus],
      };
}

enum ApplicationStatus { UNDER_REVIEW }

final applicationStatusValues =
    EnumValues({"Under review": ApplicationStatus.UNDER_REVIEW});

enum Cadre { KEN, KEM }

final cadreValues = EnumValues({"KEM": Cadre.KEM, "KEN": Cadre.KEN});

enum CadreDesc { KENYA_ENROLLED_NURSE, KENYA_ENROLLED_MIDWIFE }

final cadreDescValues = EnumValues({
  "KENYA ENROLLED MIDWIFE": CadreDesc.KENYA_ENROLLED_MIDWIFE,
  "KENYA ENROLLED NURSE": CadreDesc.KENYA_ENROLLED_NURSE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
