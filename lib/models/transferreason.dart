// To parse this JSON data, do
//
//     final internshipReason = internshipReasonFromJson(jsonString);

import 'dart:convert';

List<InternshipReason> internshipReasonFromJson(String str) =>
    List<InternshipReason>.from(
        json.decode(str).map((x) => InternshipReason.fromJson(x)));

String internshipReasonToJson(List<InternshipReason> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InternshipReason {
  InternshipReason({
    this.transferReasonId,
    this.transferReason,
    this.getMoreInfo,
  });

  String? transferReasonId;
  String? transferReason;
  String? getMoreInfo;

  factory InternshipReason.fromJson(Map<String, dynamic> json) =>
      InternshipReason(
        transferReasonId: json["transfer_reason_id"],
        transferReason: json["transfer_reason"],
        getMoreInfo: json["get_more_info"],
      );

  Map<String, dynamic> toJson() => {
        "transfer_reason_id": transferReasonId,
        "transfer_reason": transferReason,
        "get_more_info": getMoreInfo,
      };
}



// // To parse this JSON data, do
// //
// //     final internshipReason = internshipReasonFromJson(jsonString);

// import 'dart:convert';

// InternshipReason internshipReasonFromJson(String str) =>
//     InternshipReason.fromJson(json.decode(str));

// String internshipReasonToJson(InternshipReason data) =>
//     json.encode(data.toJson());

// class InternshipReason {
//   InternshipReason({
//     this.transferReasons,
//   });

//   List<TransferReason>? transferReasons;

//   factory InternshipReason.fromJson(Map<String, dynamic> json) =>
//       InternshipReason(
//         transferReasons: List<TransferReason>.from(
//             json["transfer_reasons"].map((x) => TransferReason.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "transfer_reasons":
//             List<dynamic>.from(transferReasons!.map((x) => x.toJson())),
//       };
// }

// class TransferReason {
//   TransferReason({
//     this.transferReasonId,
//     this.transferReason,
//     this.getMoreInfo,
//   });

//   String? transferReasonId;
//   String? transferReason;
//   String? getMoreInfo;

//   factory TransferReason.fromJson(Map<String, dynamic> json) => TransferReason(
//         transferReasonId: json["transfer_reason_id"],
//         transferReason: json["transfer_reason"],
//         getMoreInfo: json["get_more_info"],
//       );

//   Map<String, dynamic> toJson() => {
//         "transfer_reason_id": transferReasonId,
//         "transfer_reason": transferReason,
//         "get_more_info": getMoreInfo,
//       };
// }
