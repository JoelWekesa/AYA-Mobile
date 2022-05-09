// To parse this JSON data, do
//
//     final examsHistoryModel = examsHistoryModelFromJson(jsonString);

import 'dart:convert';

List<ExamsHistoryModel> examsHistoryModelFromJson(String str) =>
    List<ExamsHistoryModel>.from(json.decode(str).map((x) => ExamsHistoryModel.fromJson(x)));

String examsHistoryModelToJson(List<ExamsHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamsHistoryModel {
  ExamsHistoryModel({
    this.applicationId,
    this.examsSeries,
    this.cadre,
    this.applicationDate,
    this.examCenters,
    this.invoiceNo,
    this.amountDue,
    this.amountPaid,
    this.balanceDue,
  });

  String? applicationId;
  ExamsSeries? examsSeries;
  Cadre? cadre;
  DateTime? applicationDate;
  String? examCenters;
  String? invoiceNo;
  String? amountDue;
  String? amountPaid;
  String? balanceDue;

  factory ExamsHistoryModel.fromJson(Map<String, dynamic> json) => ExamsHistoryModel(
        applicationId: json["application_id"],
        examsSeries: examsSeriesValues.map?[json["exams_series"]],
        cadre: cadreValues.map?[json["cadre"]],
        applicationDate: DateTime.parse(json["application_date"]),
        examCenters: json["exam_centers"],
        invoiceNo: json["invoice_no"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        balanceDue: json["balance_due"],
      );

  Map<String, dynamic>? toJson() => {
        "application_id": applicationId,
        "exams_series": examsSeriesValues.reverse?[examsSeries],
        "cadre": cadreValues.reverse?[cadre],
        "application_date": applicationDate?.toIso8601String(),
        "exam_centers": examCenters,
        "invoice_no": invoiceNo,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "balance_due": balanceDue,
      };
}

enum Cadre { BACHELOR_OF_SCIENCE_IN_NURSING }

final cadreValues =
    EnumValues({"BACHELOR OF SCIENCE IN NURSING": Cadre.BACHELOR_OF_SCIENCE_IN_NURSING});

enum ExamsSeries { MAY_2022, APRIL_2021 }

final examsSeriesValues =
    EnumValues({"APRIL 2021": ExamsSeries.APRIL_2021, "MAY 2022": ExamsSeries.MAY_2022});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
