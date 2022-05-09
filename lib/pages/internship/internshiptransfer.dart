// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/internship/internship.dart';
import 'package:aya2/controllers/internship/internshipget.dart';
import 'package:aya2/controllers/internship/transferinternship.dart';
import 'package:aya2/controllers/internship/transferreason.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InternshipTransfer extends StatefulWidget {
  const InternshipTransfer({Key? key}) : super(key: key);

  @override
  _InternshipTransferState createState() => _InternshipTransferState();
}

class _InternshipTransferState extends State<InternshipTransfer> {
  String? transfer_internship_center;
  String? transfer_request_desc;
  final _formKey = GlobalKey<FormState>();

  String? transfer_reason;

  InternshipController internship = Get.put(InternshipController());
  TransferReasonController transfers = Get.put(TransferReasonController());
  TransferInternshipController makeTransfer =
      Get.put(TransferInternshipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Internship Transfer")),
        body: Obx(() => Form(
            key: _formKey,
            child: transfers.isLoading.value
                ? ButtonLoaderWhite()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          onChanged: (value) =>
                              transfer_internship_center = value,
                          validator: (value) =>
                              value == null ? 'Please seleect center' : null,
                          decoration: InputDecoration(
                            labelText: "Select Insitution",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                          ),
                          items: internship.centers.value.internshipCenters!
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: Text("${value.internshipCenter}",
                                  overflow: TextOverflow.fade),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          onChanged: (value) {
                            transfer_reason = value;
                            setState(() {});
                            print(transfer_reason);
                          },
                          validator: (value) =>
                              value == null ? 'Please select center' : null,
                          decoration: InputDecoration(
                            labelText: "Select Transfer reason",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(105, 240, 174, 1),
                                  width: 5.0),
                            ),
                          ),
                          // items: transfers.reasons.value.transferReasons!
                          items: transfers.reasons.value
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.transferReasonId,
                              child: Text("${value.transferReason}",
                                  overflow: TextOverflow.fade),
                            );
                          }).toList(),
                        ),
                      ),
                      transfer_reason == "4"
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Transfer request description",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 5.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  transfer_request_desc = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter username";
                                  }
                                },
                              ),
                            )
                          : SizedBox(),
                      InkWell(
                        onTap: () async {
                          await makeTransfer.transferInternship(
                              Get.arguments.internshipId,
                              transfer_reason,
                              transfer_request_desc,
                              transfer_internship_center);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 11, 48, 72),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  makeTransfer.isLoading.value
                                      ? ButtonLoader()
                                      : SizedBox(),
                                  Icon(FontAwesomeIcons.paperPlane,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Transfer",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          color: Colors.white))
                                ])),
                      ),
                    ],
                  ))));
  }
}
