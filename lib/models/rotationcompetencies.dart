// To parse this JSON data, do
//
//     final rotationCompetencies = rotationCompetenciesFromJson(jsonString);

import 'dart:convert';

RotationCompetencies rotationCompetenciesFromJson(String str) =>
    RotationCompetencies.fromJson(json.decode(str));

String rotationCompetenciesToJson(RotationCompetencies data) =>
    json.encode(data.toJson());

class RotationCompetencies {
  RotationCompetencies({
    this.rotationCompetencies,
  });

  List<RotationCompetency>? rotationCompetencies;

  factory RotationCompetencies.fromJson(Map<String, dynamic> json) =>
      RotationCompetencies(
        rotationCompetencies: List<RotationCompetency>.from(
            json["rotation_competencies"]
                .map((x) => RotationCompetency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rotation_competencies":
            List<dynamic>.from(rotationCompetencies!.map((x) => x.toJson())),
      };
}

class RotationCompetency {
  RotationCompetency({
    this.competencyId,
    this.competency,
    this.minimumRequirement,
  });

  String? competencyId;
  String? competency;
  String? minimumRequirement;

  factory RotationCompetency.fromJson(Map<String, dynamic> json) =>
      RotationCompetency(
        competencyId: json["competency_id"],
        competency: json["competency"],
        minimumRequirement: json["minimum_requirement"],
      );

  Map<String, dynamic> toJson() => {
        "competency_id": competencyId,
        "competency": competency,
        "minimum_requirement": minimumRequirement,
      };
}
