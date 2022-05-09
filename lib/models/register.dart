// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.educationId,
    this.applicationDate,
    this.currentPhoto,
  });

  String? educationId;
  DateTime? applicationDate;
  String? currentPhoto;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        educationId: json["education_id"],
        applicationDate: DateTime.parse(json["application_date"]),
        currentPhoto: json["current_photo"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "application_date": applicationDate!.toIso8601String(),
        "current_photo": currentPhoto,
      };
}
