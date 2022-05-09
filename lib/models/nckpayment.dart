// To parse this JSON data, do
//
//     final nckPayment = nckPaymentFromJson(jsonString);

import 'dart:convert';

NckPayment nckPaymentFromJson(String str) =>
    NckPayment.fromJson(json.decode(str));

String nckPaymentToJson(NckPayment data) => json.encode(data.toJson());

class NckPayment {
  NckPayment({
    this.status,
    this.message,
  });

  String? status;
  Message? message;

  factory NckPayment.fromJson(Map<String, dynamic> json) => NckPayment(
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
    this.invoiceNo,
    this.phoneNo,
    this.transaction,
  });

  String? invoiceNo;
  String? phoneNo;
  String? transaction;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        invoiceNo: json["invoice_no"],
        phoneNo: json["phone_no"],
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "invoice_no": invoiceNo,
        "phone_no": phoneNo,
        "transaction": transaction,
      };
}
