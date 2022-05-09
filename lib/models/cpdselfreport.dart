// To parse this JSON data, do
//
//     final cpdSelfReport = cpdSelfReportFromJson(jsonString);

import 'dart:convert';

CpdSelfReport cpdSelfReportFromJson(String str) =>
    CpdSelfReport.fromJson(json.decode(str));

String cpdSelfReportToJson(CpdSelfReport data) => json.encode(data.toJson());

class CpdSelfReport {
  CpdSelfReport({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory CpdSelfReport.fromJson(Map<String, dynamic> json) => CpdSelfReport(
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
    this.indexId,
    this.categoryId,
    this.eventDate,
    this.eventTitle,
    this.eventLocation,
    this.cpdEvidence,
  });

  String? indexId;
  String? categoryId;
  DateTime? eventDate;
  String? eventTitle;
  String? eventLocation;
  String? cpdEvidence;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        indexId: json["index_id"],
        categoryId: json["category_id"],
        eventDate: DateTime.parse(json["event_date"]),
        eventTitle: json["event_title"],
        eventLocation: json["event_location"],
        cpdEvidence: json["cpd_evidence"],
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "category_id": categoryId,
        "event_date": eventDate!.toIso8601String(),
        "event_title": eventTitle,
        "event_location": eventLocation,
        "cpd_evidence": cpdEvidence,
      };
}
