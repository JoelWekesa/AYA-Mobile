// To parse this JSON data, do
//
//     final competencySummaryModel = competencySummaryModelFromJson(jsonString);

import 'dart:convert';

List<CompetencySummaryModel> competencySummaryModelFromJson(String str) =>
    List<CompetencySummaryModel>.from(
        json.decode(str).map((x) => CompetencySummaryModel.fromJson(x)));

String competencySummaryModelToJson(List<CompetencySummaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompetencySummaryModel {
  CompetencySummaryModel({
    this.internshipAreaId,
    this.internshipArea,
    this.rotationAreaId,
    this.rotationArea,
    this.competencyId,
    this.competency,
    this.minimumRequirement,
    this.numberDone,
    this.status,
    this.approvalStatus,
  });

  String? internshipAreaId;
  String? internshipArea;
  String? rotationAreaId;
  String? rotationArea;
  String? competencyId;
  String? competency;
  String? minimumRequirement;
  String? numberDone;
  String? status;
  String? approvalStatus;

  factory CompetencySummaryModel.fromJson(Map<String, dynamic> json) =>
      CompetencySummaryModel(
        internshipAreaId: json["internship_area_id"],
        internshipArea: json["internship_area"],
        rotationAreaId: json["rotation_area_id"],
        rotationArea: json["rotation_area"],
        competencyId: json["competency_id"],
        competency: json["competency"],
        minimumRequirement: json["minimum_requirement"],
        numberDone: json["number_done"],
        status: json["status"],
        approvalStatus: json["approval_status"],
      );

  Map<String, dynamic> toJson() => {
        "internship_area_id": internshipAreaId,
        "internship_area": internshipArea,
        "rotation_area_id": rotationAreaId,
        "rotation_area": rotationArea,
        "competency_id": competencyId,
        "competency": competency,
        "minimum_requirement": minimumRequirement,
        "number_done": numberDone,
        "status": status,
        "approval_status": approvalStatus,
      };
}
