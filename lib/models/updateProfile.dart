// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) =>
    UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  UpdateProfile({
    this.indexId,
    this.address,
    this.email,
    this.mobileno,
    this.profilePic,
  });

  String? indexId;
  String? address;
  String? email;
  String? mobileno;
  String? profilePic;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
        indexId: json["index_id"],
        address: json["address"],
        email: json["email"],
        mobileno: json["mobileno"],
        profilePic: json["profile-pic"],
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "address": address,
        "email": email,
        "mobileno": mobileno,
        "profile-pic": profilePic,
      };
}
