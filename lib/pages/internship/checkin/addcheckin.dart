// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:aya2/controllers/internship/checkin/addcheckin.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCheckInPage extends StatefulWidget {
  const AddCheckInPage({Key? key}) : super(key: key);

  @override
  _AddCheckInPageState createState() => _AddCheckInPageState();
}

class _AddCheckInPageState extends State<AddCheckInPage> {
  final _formKey = GlobalKey<FormState>();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  AddCheckinController controller = Get.put(AddCheckinController());
  DateTime? checkinDate;
  String? nurseOfficerIncharge;
  String? nurseOfficerInchargeMobile;
  String? supervisor;
  String? supervisorMobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Add Checkin"),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                //? Commencement date picker
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2025))
                        .then((date) => setState(() => checkinDate = date)),
                    child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Check In Date: ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                checkinDate == null
                                    ? ""
                                    : formatter.format(checkinDate!),
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nurse Officer In Charge",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                    ),
                    onChanged: (value) {
                      nurseOfficerIncharge = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter nurse in charge's name";
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nurse Officer In Charge's Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                    ),
                    onChanged: (value) {
                      nurseOfficerInchargeMobile = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter nurse in charge's phone";
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Supervisor",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                    ),
                    onChanged: (value) {
                      supervisor = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter supervisor's name.";
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Supervisor Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                    ),
                    onChanged: (value) {
                      supervisorMobile = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter supervisor's phone.";
                      }
                    },
                  ),
                ),

                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.addCheckin(
                          Get.arguments.internshipId,
                          formatter.format(checkinDate!),
                          nurseOfficerIncharge,
                          nurseOfficerInchargeMobile,
                          supervisor,
                          supervisorMobile);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 11, 48, 72),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.isLoading
                                      .value // If the login process is ongoing
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
                ),
              ],
            )));
  }
}
