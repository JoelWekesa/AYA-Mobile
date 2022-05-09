// To parse this JSON data, do
//
//     final approveCompetenciesModel = approveCompetenciesModelFromJson(jsonString);

import 'dart:convert';

ApproveCompetenciesModel approveCompetenciesModelFromJson(String str) =>
    ApproveCompetenciesModel.fromJson(json.decode(str));

String approveCompetenciesModelToJson(ApproveCompetenciesModel data) =>
    json.encode(data.toJson());

class ApproveCompetenciesModel {
  ApproveCompetenciesModel({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory ApproveCompetenciesModel.fromJson(Map<String, dynamic> json) =>
      ApproveCompetenciesModel(
        status: json["status"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message?.toJson(),
      };
}

class Message {
  Message({
    this.internshipId,
    this.competencyId,
    this.approvalDate,
    this.approverName,
    this.approverIdNumber,
    this.approverPhoneNo,
  });

  String? internshipId;
  String? competencyId;
  DateTime? approvalDate;
  String? approverName;
  String? approverIdNumber;
  String? approverPhoneNo;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        internshipId: json["internship_id"],
        competencyId: json["competency_id"],
        approvalDate: DateTime.parse(json["approval_date"]),
        approverName: json["approver_name"],
        approverIdNumber: json["approver_id_number"],
        approverPhoneNo: json["approver_phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "internship_id": internshipId,
        "competency_id": competencyId,
        "approval_date": approvalDate?.toIso8601String(),
        "approver_name": approverName,
        "approver_id_number": approverIdNumber,
        "approver_phone_no": approverPhoneNo,
      };
}
