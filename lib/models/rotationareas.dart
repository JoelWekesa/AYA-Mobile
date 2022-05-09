// To parse this JSON data, do
//
//     final rotationAreasModel = rotationAreasModelFromJson(jsonString);

import 'dart:convert';

RotationAreasModel rotationAreasModelFromJson(String str) =>
    RotationAreasModel.fromJson(json.decode(str));

String rotationAreasModelToJson(RotationAreasModel data) =>
    json.encode(data.toJson());

class RotationAreasModel {
  RotationAreasModel({
    this.rotationAreas,
  });

  List<RotationArea>? rotationAreas;

  factory RotationAreasModel.fromJson(Map<String, dynamic> json) =>
      RotationAreasModel(
        rotationAreas: List<RotationArea>.from(
            json["rotation_areas"].map((x) => RotationArea.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rotation_areas":
            List<dynamic>.from(rotationAreas!.map((x) => x.toJson())),
      };
}

class RotationArea {
  RotationArea({
    this.rotationId,
    this.rotationArea,
    this.rotationDuration,
  });

  String? rotationId;
  String? rotationArea;
  String? rotationDuration;

  factory RotationArea.fromJson(Map<String, dynamic> json) => RotationArea(
        rotationId: json["rotation_id"],
        rotationArea: json["rotation_area"],
        rotationDuration: json["rotation_duration"],
      );

  Map<String, dynamic> toJson() => {
        "rotation_id": rotationId,
        "rotation_area": rotationArea,
        "rotation_duration": rotationDuration,
      };
}
