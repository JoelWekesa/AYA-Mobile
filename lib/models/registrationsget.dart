// To parse this JSON data, do
//
//     final getRegistrationsModel = getRegistrationsModelFromJson(jsonString);

import 'dart:convert';

GetRegistrationsModel getRegistrationsModelFromJson(String str) =>
    GetRegistrationsModel.fromJson(json.decode(str));

String getRegistrationsModelToJson(GetRegistrationsModel data) =>
    json.encode(data.toJson());

class GetRegistrationsModel {
  GetRegistrationsModel({
    this.registrationApplications,
  });

  List<RegistrationApplication>? registrationApplications;

  factory GetRegistrationsModel.fromJson(Map<String, dynamic> json) =>
      GetRegistrationsModel(
        registrationApplications: List<RegistrationApplication>.from(
            json["registration_applications"]
                .map((x) => RegistrationApplication.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "registration_applications": List<dynamic>.from(
            registrationApplications!.map((x) => x.toJson())),
      };
}

class RegistrationApplication {
  RegistrationApplication({
    this.applicationId,
    this.educationId,
    this.registrationNo,
    this.registrationDate,
    this.cadre,
    this.cadreDesc,
    this.applicationDate,
    this.currentPhoto,
    this.invoiceNo,
    this.amountDue,
    this.amountPaid,
    this.balanceDue,
    this.applicationStatus,
  });

  String? applicationId;
  String? educationId;
  dynamic registrationNo;
  dynamic registrationDate;
  String? cadre;
  String? cadreDesc;
  DateTime? applicationDate;
  String? currentPhoto;
  String? invoiceNo;
  String? amountDue;
  String? amountPaid;
  String? balanceDue;
  String? applicationStatus;

  factory RegistrationApplication.fromJson(Map<String, dynamic> json) =>
      RegistrationApplication(
        applicationId: json["application_id"],
        educationId: json["education_id"],
        registrationNo: json["registration_no"],
        registrationDate: json["registration_date"],
        cadre: json["cadre"],
        cadreDesc: json["cadre_desc"],
        applicationDate: DateTime.parse(json["application_date"]),
        currentPhoto: json["current_photo"],
        invoiceNo: json["invoice_no"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        balanceDue: json["balance_due"],
        applicationStatus: json["application_status"],
      );

  Map<String, dynamic> toJson() => {
        "application_id": applicationId,
        "education_id": educationId,
        "registration_no": registrationNo,
        "registration_date": registrationDate,
        "cadre": cadre,
        "cadre_desc": cadreDesc,
        "application_date": applicationDate!.toIso8601String(),
        "current_photo": currentPhoto,
        "invoice_no": invoiceNo,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "balance_due": balanceDue,
        "application_status": applicationStatus,
      };
}
