// To parse this JSON data, do
//
//     final cpdGet = cpdGetFromJson(jsonString);

import 'dart:convert';

List<CpdGet> cpdGetFromJson(String str) =>
    List<CpdGet>.from(json.decode(str).map((x) => CpdGet.fromJson(x)));

String cpdGetToJson(List<CpdGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CpdGet {
  CpdGet({
    this.provider,
    this.activityCategory,
    this.activity,
    this.activityLocation,
    this.activityDate,
    this.activityEvidence,
    this.pointsEarned,
    this.approvalStatus,
    this.approvalComments,
  });

  Provider? provider;
  String? activityCategory;
  String? activity;
  String? activityLocation;
  DateTime? activityDate;
  String? activityEvidence;
  String? pointsEarned;
  ApprovalStatus? approvalStatus;
  ApprovalComments? approvalComments;

  factory CpdGet.fromJson(Map<String, dynamic> json) => CpdGet(
        provider: providerValues.map[json["provider"]],
        activityCategory: json["activity_category"],
        activity: json["activity"],
        activityLocation: json["activity_location"],
        activityDate: DateTime.parse(json["activity_date"]),
        activityEvidence: json["activity_evidence"] == null
            ? null
            : json["activity_evidence"],
        pointsEarned: json["points_earned"],
        approvalStatus: approvalStatusValues.map[json["approval_status"]],
        approvalComments: approvalCommentsValues.map[json["approval_comments"]],
      );

  Map<String, dynamic> toJson() => {
        "provider": providerValues.reverse![provider],
        "activity_category": activityCategory,
        "activity": activity,
        "activity_location": activityLocation,
        "activity_date":
            "${activityDate!.year.toString().padLeft(4, '0')}-${activityDate!.month.toString().padLeft(2, '0')}-${activityDate!.day.toString().padLeft(2, '0')}",
        "activity_evidence": activityEvidence == null ? null : activityEvidence,
        "points_earned": pointsEarned,
        "approval_status": approvalStatusValues.reverse![approvalStatus],
        "approval_comments": approvalCommentsValues.reverse![approvalComments],
      };

  void sort(Function(dynamic a, dynamic b) param0) {}
}

enum ApprovalComments { APPROVED_AND_POINTS_AWARDED }

final approvalCommentsValues = EnumValues({
  "Approved and points awarded": ApprovalComments.APPROVED_AND_POINTS_AWARDED
});

enum ApprovalStatus { APPROVED }

final approvalStatusValues = EnumValues({"Approved": ApprovalStatus.APPROVED});

enum Provider {
  SELF_REPORTING,
  YOUR_ORGANIZATION_NAME,
  WCEA,
  PROVIDER_YOUR_ORGANIZATION_NAME
}

final providerValues = EnumValues({
  "your organization name": Provider.PROVIDER_YOUR_ORGANIZATION_NAME,
  "Self Reporting": Provider.SELF_REPORTING,
  "wcea": Provider.WCEA,
  "*your organization name": Provider.YOUR_ORGANIZATION_NAME
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
