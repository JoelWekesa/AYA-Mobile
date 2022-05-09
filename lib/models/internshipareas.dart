// To parse this JSON data, do
//
//     final internshipAreasModel = internshipAreasModelFromJson(jsonString);

import 'dart:convert';

List<InternshipAreasModel> internshipAreasModelFromJson(String str) =>
    List<InternshipAreasModel>.from(
        json.decode(str).map((x) => InternshipAreasModel.fromJson(x)));

String internshipAreasModelToJson(List<InternshipAreasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InternshipAreasModel {
  InternshipAreasModel({
    this.internshipAreaId,
    this.internshipArea,
  });

  String? internshipAreaId;
  String? internshipArea;

  factory InternshipAreasModel.fromJson(Map<String, dynamic> json) =>
      InternshipAreasModel(
        internshipAreaId: json["internship_area_id"],
        internshipArea: json["internship_area"],
      );

  Map<String, dynamic> toJson() => {
        "internship_area_id": internshipAreaId,
        "internship_area": internshipArea,
      };
}


// // To parse this JSON data, do
// //
// //     final internshipAreasModel = internshipAreasModelFromJson(jsonString);

// import 'dart:convert';

// InternshipAreasModel internshipAreasModelFromJson(String str) =>
//     InternshipAreasModel.fromJson(json.decode(str));

// String internshipAreasModelToJson(InternshipAreasModel data) =>
//     json.encode(data.toJson());

// class InternshipAreasModel {
//   InternshipAreasModel({
//     this.internshipAreas,
//   });

//   List<InternshipArea>? internshipAreas;

//   factory InternshipAreasModel.fromJson(Map<String, dynamic> json) =>
//       InternshipAreasModel(
//         internshipAreas: List<InternshipArea>.from(
//             json["internship_areas"].map((x) => InternshipArea.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "internship_areas":
//             List<dynamic>.from(internshipAreas!.map((x) => x.toJson())),
//       };
// }

// class InternshipArea {
//   InternshipArea({
//     this.internshipAreaId,
//     this.internshipArea,
//   });

//   String? internshipAreaId;
//   String? internshipArea;

//   factory InternshipArea.fromJson(Map<String, dynamic> json) => InternshipArea(
//         internshipAreaId: json["internship_area_id"],
//         internshipArea: json["internship_area"],
//       );

//   Map<String, dynamic> toJson() => {
//         "internship_area_id": internshipAreaId,
//         "internship_area": internshipArea,
//       };
// }
