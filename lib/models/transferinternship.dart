// To parse this JSON data, do
//
//     final transferInternship = transferInternshipFromJson(jsonString);

import 'dart:convert';

TransferInternship transferInternshipFromJson(String str) =>
    TransferInternship.fromJson(json.decode(str));

String transferInternshipToJson(TransferInternship data) =>
    json.encode(data.toJson());

class TransferInternship {
  TransferInternship({
    this.internshipId,
    this.transferReasonId,
    this.transferRequestDesc,
    this.transferInternshipCenter,
  });

  String? internshipId;
  String? transferReasonId;
  String? transferRequestDesc;
  String? transferInternshipCenter;

  factory TransferInternship.fromJson(Map<String, dynamic> json) =>
      TransferInternship(
        internshipId: json["internship_id"],
        transferReasonId: json["transfer_reason_id"],
        transferRequestDesc: json["transfer_request_desc"],
        transferInternshipCenter: json["transfer_internship_center"],
      );

  Map<String, dynamic> toJson() => {
        "internship_id": internshipId,
        "transfer_reason_id": transferReasonId,
        "transfer_request_desc": transferRequestDesc,
        "transfer_internship_center": transferInternshipCenter,
      };
}
