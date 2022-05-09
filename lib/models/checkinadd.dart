// To parse this JSON data, do
//
//     final checkInAddModel = checkInAddModelFromJson(jsonString);

import 'dart:convert';

CheckInAddModel checkInAddModelFromJson(String str) =>
    CheckInAddModel.fromJson(json.decode(str));

String checkInAddModelToJson(CheckInAddModel data) =>
    json.encode(data.toJson());

class CheckInAddModel {
  CheckInAddModel({
    this.internshipId,
    this.transferReasonId,
    this.transferRequestDesc,
    this.transferInternshipCenter,
  });

  String? internshipId;
  String? transferReasonId;
  String? transferRequestDesc;
  String? transferInternshipCenter;

  factory CheckInAddModel.fromJson(Map<String, dynamic> json) =>
      CheckInAddModel(
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
