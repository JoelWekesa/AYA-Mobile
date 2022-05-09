// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
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
    this.mobileNo,
    this.task,
    this.otp,
  });

  String? indexId;
  String? mobileNo;
  String? task;
  int? otp;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        indexId: json["index_id"],
        mobileNo: json["mobile_no"],
        task: json["task"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "mobile_no": mobileNo,
        "task": task,
        "otp": otp,
      };
}
