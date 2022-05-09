// To parse this JSON data, do
//
//     final transferreasonsget = transferreasonsgetFromJson(jsonString);

import 'dart:convert';

Transferreasonsget transferreasonsgetFromJson(String str) =>
    Transferreasonsget.fromJson(json.decode(str));

String transferreasonsgetToJson(Transferreasonsget data) =>
    json.encode(data.toJson());

class Transferreasonsget {
  Transferreasonsget({
    this.transferReasons,
  });

  List<TransferReason>? transferReasons;

  factory Transferreasonsget.fromJson(Map<String, dynamic> json) =>
      Transferreasonsget(
        transferReasons: List<TransferReason>.from(
            json["transfer_reasons"].map((x) => TransferReason.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transfer_reasons":
            List<dynamic>.from(transferReasons!.map((x) => x.toJson())),
      };
}

class TransferReason {
  TransferReason({
    this.transferReasonId,
    this.transferReason,
    this.getMoreInfo,
  });

  String? transferReasonId;
  String? transferReason;
  String? getMoreInfo;

  factory TransferReason.fromJson(Map<String, dynamic> json) => TransferReason(
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
