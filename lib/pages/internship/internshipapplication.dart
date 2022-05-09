// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:io';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/education.dart';
import 'package:aya2/controllers/internship/internship.dart';
import 'package:aya2/controllers/internship/internshipapply.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class InternshipApplication extends StatefulWidget {
  const InternshipApplication({Key? key}) : super(key: key);

  @override
  _InternshipApplicationState createState() => _InternshipApplicationState();
}

class _InternshipApplicationState extends State<InternshipApplication> {
  InternshipController internship = Get.put(InternshipController());
  LoginController login = Get.put(LoginController());
  InternshipApplyController apply = Get.put(InternshipApplyController());
  // EducationController education = Get.put(EducationController());

  String? internship_center;
  String? education_id;
  DateTime? start_date;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  File? degree_cert;
  File? posting_letter;
  final _formKey = GlobalKey<FormState>();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final tempImage = File(image.path);
      setState(() {
        degree_cert = tempImage;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future pickLetter() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final tempImage = File(image.path);
      setState(() {
        posting_letter = tempImage;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await login, //education.getEducation(),
      child: Obx(() => internship.isLoading.value //|| education.isLoading.value
          ? Center(
              child: SpinKitCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : //education.success.value && education.education.isEmpty ||
          login.data.value.education!.length != 1
              ? centerText(
                  "You are currently not elligible to apply for an internship",
                )
              //To check CPD points
              // : int.parse('${login.data.value.cpd!.single.currentPoints!}') <
              //         int.parse(
              //             '${login.data.value.cpd!.single.cpdRequirement!}')
              //     ? centerText(
              //         "You are currently not elligible to apply. Current CPD points is below ${login.data.value.cpd!.single.cpdRequirement!}",
              //       )
              : Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      //? Cadre picker

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          onChanged: (value) => education_id = value,
                          validator: (value) =>
                              value == null ? 'Please select education' : null,
                          decoration: InputDecoration(
                            labelText: "Select Education",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                          ),
                          items: login.data.value.education!
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: login
                                  .data.value.education!.first.educationId
                                  .toString(),
                              child: Text(
                                  "${login.data.value.education!.first.cadreText}",
                                  overflow: TextOverflow.fade),
                            );
                          }).toList(),
                        ),
                      ),
                      //? Institution picker
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          onChanged: (value) => internship_center = value,
                          validator: (value) =>
                              value == null ? 'Please select center' : null,
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
                      //? Commencement date picker
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025))
                              .then(
                                  (date) => setState(() => start_date = date)),
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
                                      "Internship Commencement Date: ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      start_date == null
                                          ? ""
                                          : formatter.format(start_date!),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ))),
                        ),
                      ),
                      //? End date picker
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: InkWell(
                      //     onTap: () => showDatePicker(
                      //             context: context,
                      //             initialDate: DateTime.now(),
                      //             firstDate: DateTime(2020),
                      //             lastDate: DateTime(2025))
                      //         .then((date) => setState(() => passingExam = date)),
                      //     child: Container(
                      //         height: 70,
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(8))),
                      //         child: Center(
                      //             child: Column(
                      //           children: [
                      //             Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child:
                      //                   Text("Date of Passing Graduation Exam: "),
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Text(passingExam == null
                      //                   ? ""
                      //                   : formatter.format(passingExam!)),
                      //             )
                      //           ],
                      //         ))),
                      //   ),
                      // ),
                      //? Degree picker
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => pickImage(),
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                child: ListTile(
                                    leading: degree_cert == null
                                        ? Icon(FontAwesomeIcons.fileImage,
                                            size: 50)
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(degree_cert!)),
                                    title: degree_cert == null
                                        ? Text("Select Degree")
                                        : Text("My degree")),
                              )),
                        ),
                      ),
                      //? Letter picker
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => pickLetter(),
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                child: ListTile(
                                    leading: posting_letter == null
                                        ? Icon(FontAwesomeIcons.fileImage,
                                            size: 50)
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(posting_letter!)),
                                    title: posting_letter == null
                                        ? Text("Select Posting Letter")
                                        : Text("My Posting Letter")),
                              )),
                        ),
                      ),

                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await apply.applyInternship(
                                posting_letter,
                                degree_cert,
                                education_id,
                                internship_center,
                                formatter.format(start_date!));
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
                          child: Obx(() => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    apply.isLoading
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
                  ))),
    );
  }
}
