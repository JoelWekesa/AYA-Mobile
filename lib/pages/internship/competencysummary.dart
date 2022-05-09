// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:aya2/controllers/internship/approvecompetencies.dart';
import 'package:aya2/controllers/internship/competency.dart';
import 'package:aya2/controllers/otp.dart';
import 'package:aya2/controllers/otpverify.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CompetencySummaryPage extends StatefulWidget {
  const CompetencySummaryPage({Key? key}) : super(key: key);

  @override
  _CompetencySummaryPageState createState() => _CompetencySummaryPageState();
}

class _CompetencySummaryPageState extends State<CompetencySummaryPage> {
  String? supervisorPhone = "";
  String? supervisorName = "";
  String? supervisorId = "";
  String? otpNo = "";
  var data = Get.arguments;
  var info = Competencyinfo();
  CompetencySummaryController competencies =
      Get.put(CompetencySummaryController());
  OTPController otp = Get.put(OTPController());
  OTPVerifyController verify = Get.put(OTPVerifyController());
  ApproveCompetenciesController approve =
      Get.put(ApproveCompetenciesController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Competency Summary"),
        body: Obx(
          () => competencies.isLoading.value
              ? ButtonLoaderWhite()
              : competencies.competencies.isEmpty
                  ? Center(
                      child: Text(
                        "No competency reported for this internship",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : Obx(() => ListView.builder(
                        itemCount: competencies.competencies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Internship Area",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        width: 200,
                                        height: 30,
                                        child: Text(
                                            "${info(index).internshipArea}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Rotation Area",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        width: 200,
                                        height: 30,
                                        child: Text(
                                            "${info(index).rotationArea}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Competency",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        width: 200,
                                        height: 30,
                                        child: Text("${info(index).competency}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Minimum Requirement",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        width: 200,
                                        height: 30,
                                        child: Text(
                                            "${info(index).minimumRequirement}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Number Done",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        width: 200,
                                        height: 30,
                                        child: Text("${info(index).numberDone}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Status",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Obx(() => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text("${info(index).status}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: info(index).status ==
                                                            "Complete"
                                                        ? Colors.green
                                                        : Colors.red)),
                                          ),
                                        )),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                          height: 30,
                                          child: Text("Approval Status",
                                              style: TextStyle(
                                                  color: Colors.grey))),
                                    ),
                                    Obx(() => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text(
                                                "${info(index).approvalStatus}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: info(index)
                                                                .approvalStatus ==
                                                            "Approved"
                                                        ? Colors.green
                                                        : Colors.red)),
                                          ),
                                        )),
                                    int.parse(info(index).numberDone) >=
                                            int.parse(
                                                info(index).minimumRequirement)
                                        ? Obx(() => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: FractionallySizedBox(
                                                widthFactor: 1,
                                                child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      showDialog(
                                                          barrierLabel:
                                                              "Request Approval",
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              content: Stack(
                                                                children: <
                                                                    Widget>[
                                                                  Positioned(
                                                                    right:
                                                                        -40.0,
                                                                    top: -40.0,
                                                                    child:
                                                                        InkResponse(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          CircleAvatar(
                                                                        child: Icon(
                                                                            Icons.close),
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  !otp.success
                                                                          .value
                                                                      ? Form(
                                                                          key:
                                                                              _formKey,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: TextFormField(
                                                                                    onChanged: (value) {
                                                                                      supervisorName = value;
                                                                                    },
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return "Enter Supervisor name";
                                                                                      }
                                                                                    },
                                                                                    decoration: InputDecoration(prefixIcon: Icon(FontAwesomeIcons.user), label: Text("Supervisor name"))),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: TextFormField(
                                                                                    onChanged: (value) {
                                                                                      supervisorId = value;
                                                                                    },
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return "Enter Supervisor id";
                                                                                      }
                                                                                    },
                                                                                    decoration: InputDecoration(prefixIcon: Icon(FontAwesomeIcons.user), label: Text("Supervisor ID"))),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: TextFormField(
                                                                                    onChanged: (value) {
                                                                                      supervisorPhone = value;
                                                                                    },
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return "Enter Supervisor phone";
                                                                                      }
                                                                                    },
                                                                                    decoration: InputDecoration(prefixIcon: Icon(FontAwesomeIcons.user), label: Text("Supervisor phone"))),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: ElevatedButton(
                                                                                  child: Text("Submit"),
                                                                                  onPressed: () async {
                                                                                    if (_formKey.currentState!.validate()) {
                                                                                      _formKey.currentState!.save();
                                                                                      Get.back();
                                                                                      await otp.otpService(supervisorPhone!, "generate", "");
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Form(
                                                                          key:
                                                                              _formKey,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: <Widget>[
                                                                              Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: TextFormField(
                                                                                    onChanged: (value) {
                                                                                      otpNo = value;
                                                                                    },
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return "Enter Otp";
                                                                                      }
                                                                                    },
                                                                                    decoration: InputDecoration(prefixIcon: Icon(FontAwesomeIcons.user), label: Text("NCK OTP"))),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: ElevatedButton(
                                                                                  child: Text("Submit"),
                                                                                  onPressed: () async {
                                                                                    if (_formKey.currentState!.validate()) {
                                                                                      Get.back();
                                                                                      await verify.otpService(supervisorPhone!, otpNo!);
                                                                                      await approve.approveCompetency('${data["internshipId"]}', '${info(index).competencyId}', supervisorName!, supervisorId!, supervisorPhone!);
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    style: otp.success.value
                                                        ? ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .green)
                                                        : ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .blue),
                                                    icon: Icon(
                                                        FontAwesomeIcons.check),
                                                    label: Text(otp
                                                            .success.value
                                                        ? "Verify OTP"
                                                        : "Request Approval")),
                                              ),
                                            ))
                                        : SizedBox(),
                                  ]));
                        },
                      )),
        ));
  }
}

class Competencyinfo {
  call(int index) {
    CompetencySummaryController competencies = Get.find();
    return competencies.competencies[index];
  }
}
