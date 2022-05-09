// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.id,
    this.indexNo,
    this.name,
    this.idNumber,
    this.passportNumber,
    this.birthCertNo,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.email,
    this.mobileNo,
    this.profilePic,
    this.education,
    this.registration,
    this.license,
    this.cpd,
    this.token,
  });

  String? id;
  String? indexNo;
  String? name;
  String? idNumber;
  String? passportNumber;
  String? birthCertNo;
  DateTime? dateOfBirth;
  String? gender;
  String? address;
  String? email;
  String? mobileNo;
  String? profilePic;
  List<Education>? education;
  List<Registration>? registration;
  List<License>? license;
  List<Cpd>? cpd;
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        indexNo: json["IndexNo"],
        name: json["Name"],
        idNumber: json["IdNumber"],
        passportNumber: json["PassportNumber"],
        birthCertNo: json["BirthCertNo"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        gender: json["Gender"],
        address: json["Address"],
        email: json["Email"],
        mobileNo: json["MobileNo"],
        profilePic: json["ProfilePic"],
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        registration: List<Registration>.from(
            json["registration"].map((x) => Registration.fromJson(x))),
        license:
            List<License>.from(json["license"].map((x) => License.fromJson(x))),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "IndexNo": indexNo,
        "Name": name,
        "IdNumber": idNumber,
        "PassportNumber": passportNumber,
        "BirthCertNo": birthCertNo,
        "DateOfBirth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "Gender": gender,
        "Address": address,
        "Email": email,
        "MobileNo": mobileNo,
        "ProfilePic": profilePic,
        "education": List<dynamic>.from(education!.map((x) => x.toJson())),
        "registration":
            List<dynamic>.from(registration!.map((x) => x.toJson())),
        "license": List<dynamic>.from(license!.map((x) => x.toJson())),
        "token": token,
      };
}

class Cpd {
  Cpd({
    this.cpdRequirement,
    this.currentPoints,
  });

  String? cpdRequirement;
  String? currentPoints;

  factory Cpd.fromJson(Map<String, dynamic> json) => Cpd(
        cpdRequirement: json["cpd_requirement"],
        currentPoints: json["current_points"],
      );

  Map<String, dynamic> toJson() =>
      {"cpd_requirement": cpdRequirement, "current_points": currentPoints};
}

class Education {
  Education({
    this.educationId,
    this.cadre,
    this.cadreText,
    this.institution,
    this.admissionDate,
    this.eligibleForInternship,
  });

  String? educationId;
  String? cadre;
  String? cadreText;
  String? institution;
  DateTime? admissionDate;
  String? eligibleForInternship;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        educationId: json["education_id"],
        cadre: json["cadre"],
        cadreText: json["cadre_text"],
        institution: json["institution"],
        admissionDate: DateTime.parse(json["admission_date"]),
        eligibleForInternship: json["eligible_for_internship"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "cadre": cadre,
        "cadre_text": cadreText,
        "institution": institution,
        "admission_date":
            "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "eligible_for_internship": eligibleForInternship,
      };
}

class License {
  License({
    this.licenseNo,
    this.fromDate,
    this.toDate,
    this.workStation,
  });

  String? licenseNo;
  DateTime? fromDate;
  DateTime? toDate;
  String? workStation;

  factory License.fromJson(Map<String, dynamic> json) => License(
        licenseNo: json["license_no"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        workStation: json["workStation"] == null ? null : json["workStation"],
      );

  Map<String, dynamic> toJson() => {
        "license_no": licenseNo,
        "from_date":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "workStation": workStation == null ? null : workStation,
      };
}

class Registration {
  Registration({
    this.regNo,
    this.cadre,
    this.cadreText,
  });

  String? regNo;
  String? cadre;
  String? cadreText;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        regNo: json["reg_no"],
        cadre: json["cadre"],
        cadreText: json["cadre_text"],
      );

  Map<String, dynamic> toJson() => {
        "reg_no": regNo,
        "cadre": cadre,
        "cadre_text": cadreText,
      };
}
