// To parse this JSON data, do
//
//     final licenceApply = licenceApplyFromJson(jsonString);

import 'dart:convert';

LicenceApply licenceApplyFromJson(String str) =>
    LicenceApply.fromJson(json.decode(str));

String licenceApplyToJson(LicenceApply data) => json.encode(data.toJson());

class LicenceApply {
  LicenceApply({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory LicenceApply.fromJson(Map<String, dynamic> json) => LicenceApply(
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
    this.indexId,
    this.renewalDate,
    this.workstationId,
    this.employerId,
    this.countyId,
    this.workstationName,
  });

  String? indexId;
  DateTime? renewalDate;
  String? workstationId;
  String? employerId;
  String? countyId;
  String? workstationName;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        indexId: json["index_id"],
        renewalDate: DateTime.parse(json["renewal_date"]),
        workstationId: json["workstation_id"],
        employerId: json["employer_id"],
        countyId: json["county_id"],
        workstationName: json["workstation_name"],
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "renewal_date": renewalDate?.toIso8601String(),
        "workstation_id": workstationId,
        "employer_id": employerId,
        "county_id": countyId,
        "workstation_name": workstationName,
      };
}
