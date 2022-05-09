// To parse this JSON data, do
//
//     final licenceApplications = licenceApplicationsFromJson(jsonString);

import 'dart:convert';

List<LicenceApplications> licenceApplicationsFromJson(String str) =>
    List<LicenceApplications>.from(
        json.decode(str).map((x) => LicenceApplications.fromJson(x)));

String licenceApplicationsToJson(List<LicenceApplications> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LicenceApplications {
  LicenceApplications({
    this.applicationId,
    this.renewalYear,
    this.renewalDate,
    this.workstationId,
    this.workstationName,
    this.employerId,
    this.employer,
    this.countyId,
    this.county,
    this.invoiceNo,
    this.amountDue,
    this.amountPaid,
    this.balanceDue,
  });

  String? applicationId;
  String? renewalYear;
  DateTime? renewalDate;
  String? workstationId;
  WorkstationName? workstationName;
  String? employerId;
  Employer? employer;
  String? countyId;
  County? county;
  String? invoiceNo;
  String? amountDue;
  String? amountPaid;
  String? balanceDue;

  factory LicenceApplications.fromJson(Map<String, dynamic> json) =>
      LicenceApplications(
        applicationId: json["application_id"],
        renewalYear: json["renewal_year"],
        renewalDate: DateTime.parse(json["renewal_date"]),
        workstationId: json["workstation_id"],
        workstationName: workstationNameValues.map[json["workstation_name"]],
        employerId: json["employer_id"],
        employer: employerValues.map[json["employer"]],
        countyId: json["county_id"],
        county: countyValues.map[json["County"]],
        invoiceNo: json["invoice_no"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        balanceDue: json["balance_due"],
      );

  Map<String, dynamic> toJson() => {
        "application_id": applicationId,
        "renewal_year": renewalYear,
        "renewal_date": renewalDate?.toIso8601String(),
        "workstation_id": workstationId,
        "workstation_name": workstationNameValues.reverse[workstationName],
        "employer_id": employerId,
        "employer": employerValues.reverse[employer],
        "county_id": countyId,
        "County": countyValues.reverse[county],
        "invoice_no": invoiceNo,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "balance_due": balanceDue,
      };
}

enum County { GARISSA }

final countyValues = EnumValues({"GARISSA": County.GARISSA});

enum Employer { COMMUNITY }

final employerValues = EnumValues({"COMMUNITY": Employer.COMMUNITY});

enum WorkstationName { ABC_THANGE_DISPENSARY }

final workstationNameValues = EnumValues(
    {"ABC Thange Dispensary": WorkstationName.ABC_THANGE_DISPENSARY});

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
