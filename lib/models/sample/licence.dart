// To parse this JSON data, do
//
//     final sampleLicenceApplyModel = sampleLicenceApplyModelFromJson(jsonString);

import 'dart:convert';

SampleLicenceApplyModel sampleLicenceApplyModelFromJson(String str) =>
    SampleLicenceApplyModel.fromJson(json.decode(str));

String sampleLicenceApplyModelToJson(SampleLicenceApplyModel data) => json.encode(data.toJson());

class SampleLicenceApplyModel {
  SampleLicenceApplyModel({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory SampleLicenceApplyModel.fromJson(Map<String, dynamic> json) => SampleLicenceApplyModel(
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
    this.renewalDate,
    this.workstationId,
    this.employerId,
    this.countyId,
    this.workstationName,
  });

  String? indexId;
  String? renewalDate;
  String? workstationId;
  String? employerId;
  String? countyId;
  String? workstationName;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        indexId: json["index_id"],
        renewalDate: json["renewal_date"],
        workstationId: json["workstation_id"],
        employerId: json["employer_id"],
        countyId: json["county_id"],
        workstationName: json["workstation_name"],
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "renewal_date": renewalDate,
        "workstation_id": workstationId,
        "employer_id": employerId,
        "county_id": countyId,
        "workstation_name": workstationName,
      };
}
