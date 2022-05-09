// To parse this JSON data, do
//
//     final checkinGet = checkinGetFromJson(jsonString);

import 'dart:convert';

List<CheckinGet> checkinGetFromJson(String str) =>
    List<CheckinGet>.from(json.decode(str).map((x) => CheckinGet.fromJson(x)));

String checkinGetToJson(List<CheckinGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckinGet {
  CheckinGet({
    this.checkinId,
    this.checkinDate,
    this.nurseOfficerIncharge,
    this.nurseOfficerInchargeMobile,
    this.supervisor,
    this.supervisorMobile,
    this.internshipCenter,
  });

  String? checkinId;
  DateTime? checkinDate;
  String? nurseOfficerIncharge;
  String? nurseOfficerInchargeMobile;
  String? supervisor;
  String? supervisorMobile;
  InternshipCenter? internshipCenter;

  factory CheckinGet.fromJson(Map<String, dynamic> json) => CheckinGet(
        checkinId: json["checkin_id"],
        checkinDate: DateTime.parse(json["checkin_date"]),
        nurseOfficerIncharge: json["nurse_officer_incharge"],
        nurseOfficerInchargeMobile: json["nurse_officer_incharge_mobile"],
        supervisor: json["supervisor"],
        supervisorMobile: json["supervisor_mobile"],
        internshipCenter: internshipCenterValues.map[json["internship_center"]],
      );

  Map<String, dynamic> toJson() => {
        "checkin_id": checkinId,
        "checkin_date": checkinDate!.toIso8601String(),
        "nurse_officer_incharge": nurseOfficerIncharge,
        "nurse_officer_incharge_mobile": nurseOfficerInchargeMobile,
        "supervisor": supervisor,
        "supervisor_mobile": supervisorMobile,
        "internship_center": internshipCenterValues.reverse[internshipCenter],
      };
}

enum InternshipCenter {
  KISII_TEACHING_AND_REERRAL_HOSPITAL,
  KAPKATET_DISTRICT_HOSPITAL,
  ISIOLO_DISTRICT_HOSPITAL
}

final internshipCenterValues = EnumValues({
  "Isiolo District Hospital": InternshipCenter.ISIOLO_DISTRICT_HOSPITAL,
  "Kapkatet District Hospital": InternshipCenter.KAPKATET_DISTRICT_HOSPITAL,
  "KISII TEACHING AND REERRAL HOSPITAL":
      InternshipCenter.KISII_TEACHING_AND_REERRAL_HOSPITAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
