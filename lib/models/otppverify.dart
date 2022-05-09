// To parse this JSON data, do
//
//     final otpModelVerify = otpModelVerifyFromJson(jsonString);

import 'dart:convert';

OtpModelVerify otpModelVerifyFromJson(String str) =>
    OtpModelVerify.fromJson(json.decode(str));

String otpModelVerifyToJson(OtpModelVerify data) => json.encode(data.toJson());

class OtpModelVerify {
  OtpModelVerify({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory OtpModelVerify.fromJson(Map<String, dynamic> json) => OtpModelVerify(
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
  String? otp;

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
