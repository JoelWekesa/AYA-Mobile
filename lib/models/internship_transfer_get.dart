// To parse this JSON data, do
//
//     final InternshipTransferGet = internshipTransferGetFromJson(jsonString);

import 'dart:convert';

List<InternshipTransferGet> internshipTransferGetFromJson(String str) =>
    List<InternshipTransferGet>.from(
        json.decode(str).map((x) => InternshipTransferGet.fromJson(x)));

String internshipTransferGetToJson(List<InternshipTransferGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InternshipTransferGet {
  InternshipTransferGet({
    this.transferRequestId,
    this.transferReasonDesc,
    this.requestDate,
    this.centerFrom,
    this.centerTo,
    this.applicationStatus,
  });

  String? transferRequestId;
  TransferReasonDesc? transferReasonDesc;
  DateTime? requestDate;
  CenterFrom? centerFrom;
  String? centerTo;
  ApplicationStatus? applicationStatus;

  factory InternshipTransferGet.fromJson(Map<String, dynamic> json) =>
      InternshipTransferGet(
        transferRequestId: json["transfer_request_id"],
        transferReasonDesc:
            transferReasonDescValues.map[json["transfer_reason_desc"]],
        requestDate: DateTime.parse(json["request_date"]),
        centerFrom: centerFromValues.map[json["center_from"]],
        centerTo: json["center_to"],
        applicationStatus:
            applicationStatusValues.map[json["application_status"]],
      );

  Map<String, dynamic> toJson() => {
        "transfer_request_id": transferRequestId,
        "transfer_reason_desc":
            transferReasonDescValues.reverse[transferReasonDesc],
        "request_date": requestDate?.toIso8601String(),
        "center_from": centerFromValues.reverse[centerFrom],
        "center_to": centerTo,
        "application_status":
            applicationStatusValues.reverse[applicationStatus],
      };
}

enum ApplicationStatus { UNDER_REVIEW }

final applicationStatusValues =
    EnumValues({"Under review": ApplicationStatus.UNDER_REVIEW});

enum CenterFrom {
  KISII_TEACHING_AND_REERRAL_HOSPITAL,
  ISIOLO_DISTRICT_HOSPITAL
}

final centerFromValues = EnumValues({
  "Isiolo District Hospital": CenterFrom.ISIOLO_DISTRICT_HOSPITAL,
  "KISII TEACHING AND REERRAL HOSPITAL":
      CenterFrom.KISII_TEACHING_AND_REERRAL_HOSPITAL
});

enum TransferReasonDesc {
  OTHER,
  STANDARD_REASON_3,
  STANDARD_REASON_2,
  STANDARD_REASON_1
}

final transferReasonDescValues = EnumValues({
  "Other": TransferReasonDesc.OTHER,
  "Standard Reason 1": TransferReasonDesc.STANDARD_REASON_1,
  "Standard Reason 2": TransferReasonDesc.STANDARD_REASON_2,
  "Standard Reason 3": TransferReasonDesc.STANDARD_REASON_3
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
