// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/internship/rotation/rotationcapture.dart';
import 'package:aya2/controllers/internship/rotation/rotationcompetencies.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RotationCompetenciesPage extends StatefulWidget {
  const RotationCompetenciesPage({Key? key}) : super(key: key);

  @override
  _RotationCompetenciesPageState createState() =>
      _RotationCompetenciesPageState();
}

class _RotationCompetenciesPageState extends State<RotationCompetenciesPage> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String? activityNotes;
  DateTime? activityDate;
  String? competencyId;
  final _formKey = GlobalKey<FormState>();

  RotationCompetenciesController controller = Get.find();
  final capture = Get.put(RotationCaptureController());
  final competencyController = TextEditingController();
  final activityController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Rotation Competencies"),
        body: Obx(() => Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      onChanged: (value) => competencyId = value,
                      validator: (value) =>
                          value == null ? 'Please select competency' : null,
                      decoration: InputDecoration(
                        labelText: "Select Competency",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                      ),
                      items: controller
                          .data.value.rotationCompetencies!.reversed
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.competencyId,
                          child: Text(
                              "${value.competency}, Minimum required: ${value.minimumRequirement} ",
                              overflow: TextOverflow.fade),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: activityController,
                      maxLines: 2,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3000),
                      ],
                      decoration: InputDecoration(
                        labelText: "Activity Notes",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                      ),
                      onChanged: (value) {
                        activityNotes = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter activity notes";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025))
                          .then((date) => setState(() => activityDate = date)),
                      child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Activity Date: ",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  activityDate == null
                                      ? ""
                                      : formatter.format(activityDate!),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ))),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     // controller: activityController,
                  //     maxLines: 2,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(3000),
                  //     ],
                  //     decoration: InputDecoration(
                  //       labelText: "Supervisor Name",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             BorderSide(color: Colors.greenAccent, width: 5.0),
                  //       ),
                  //     ),
                  //     // onChanged: (value) {
                  //     //   eventTitle = value;
                  //     // },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Please enter supervisor name.";
                  //       }
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     // controller: activityController,
                  //     maxLines: 2,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(3000),
                  //     ],
                  //     decoration: InputDecoration(
                  //       labelText: "Supervisor Phone No.",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             BorderSide(color: Colors.greenAccent, width: 5.0),
                  //       ),
                  //     ),
                  //     // onChanged: (value) {
                  //     //   eventTitle = value;
                  //     // },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Please enter supervisor phone number.";
                  //       }
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     // controller: activityController,
                  //     maxLines: 2,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(3000),
                  //     ],
                  //     decoration: InputDecoration(
                  //       labelText: "Supervisor Email",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             BorderSide(color: Colors.greenAccent, width: 5.0),
                  //       ),
                  //     ),
                  //     // onChanged: (value) {
                  //     //   eventTitle = value;
                  //     // },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Please enter supervisor email.";
                  //       }
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     // controller: activityController,
                  //     maxLines: 2,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(3000),
                  //     ],
                  //     decoration: InputDecoration(
                  //       labelText: "Supervisor Designation",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             BorderSide(color: Colors.greenAccent, width: 5.0),
                  //       ),
                  //     ),
                  //     // onChanged: (value) {
                  //     //   eventTitle = value;
                  //     // },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Please enter supervisor designation.";
                  //       }
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     // controller: activityController,
                  //     maxLines: 2,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(3000),
                  //     ],
                  //     decoration: InputDecoration(
                  //       labelText: "Supervisor Licence No.",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             BorderSide(color: Colors.greenAccent, width: 5.0),
                  //       ),
                  //     ),
                  //     // onChanged: (value) {
                  //     //   eventTitle = value;
                  //     // },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Please enter supervisor licence number.";
                  //       }
                  //     },
                  //   ),
                  // ),

                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (activityDate != null && competencyId != null) {
                          await capture.rotationCapture(
                              Get.arguments["internshipId"],
                              competencyId,
                              activityNotes,
                              formatter.format(activityDate!));

                          activityController.clear();
                          setState(() {
                            competencyId = null;
                            activityDate = null;
                          });
                        } else {
                          showDialogFail("Error", "Please fill all fields");
                        }
                      }
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
                              capture.isLoading.value
                                  ? ButtonLoader()
                                  : SizedBox(),
                              Icon(FontAwesomeIcons.paperPlane,
                                  color: Colors.white),
                              SizedBox(width: 10),
                              Text("Submit",
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 20,
                                      color: Colors.white))
                            ])),
                  ),
                  // InkWell(
                  //   onTap: () async {},
                  //   child: Container(
                  //       alignment: Alignment.center,
                  //       height: 50,
                  //       width: double.infinity,
                  //       margin: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           color: Colors.blue,
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10))),
                  //       child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             capture.isLoading.value
                  //                 ? ButtonLoader()
                  //                 : SizedBox(),
                  //                 onPressed: () {
                  //                     Get.toNamed("/checkin",
                  //                         arguments: controller.data.value
                  //                             .internshipApplications![index]);
                  //                   },
                  //             Icon(FontAwesomeIcons.eye, color: Colors.white),
                  //             SizedBox(width: 10),
                  //             Text("View Submissions",
                  //                 style: TextStyle(
                  //                     letterSpacing: 2,
                  //                     fontSize: 20,
                  //                     color: Colors.white))
                  //           ])),
                  // )
                ],
              ),
            )));
  }
}
