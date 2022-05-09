// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/exam/examcenters.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamApplyComponent extends StatefulWidget {
  const ExamApplyComponent({Key? key}) : super(key: key);

  @override
  State<ExamApplyComponent> createState() => _ExamApplyComponentState();
}

class _ExamApplyComponentState extends State<ExamApplyComponent> {
  @override
  Widget build(BuildContext context) {
    ExamCentersController examCenters = Get.put(ExamCentersController());
    AuthenticatedUserController authenticated = Get.put(AuthenticatedUserController());

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String? center;
    String? secondCenter;
    final _formKey = GlobalKey<FormState>();
    final seriesId = Get.arguments;
    return Obx(() => examCenters.isLoading.value
        ? Center(child: Text("Getting centers...", style: Theme.of(context).textTheme.bodyText1))
        : customContainer(
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        onChanged: (value) async {
                          center = value;
                        },
                        validator: (value) => value == null ? 'Please select an exam center' : null,
                        decoration: InputDecoration(
                          labelText: "Select Center",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                          ),
                        ),
                        items: examCenters.data.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.examCenterId,
                            child: Text(value.examCenter!, overflow: TextOverflow.fade),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        onChanged: (value) async {
                          secondCenter = value;
                        },
                        validator: (value) => value == null ? 'Please select an exam center' : null,
                        decoration: InputDecoration(
                          labelText: "Select Center",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                          ),
                        ),
                        items: examCenters.data.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.examCenterId,
                            child: Text(value.examCenter!, overflow: TextOverflow.fade),
                          );
                        }).toList(),
                      ),
                    ),
                    InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            Map<String, String> body = {
                              "student_series_id": seriesId,
                              "index_id": authenticated.data.value.id!,
                              "exam_centers": "$center, $secondCenter",
                              "application_date": formatter.format(DateTime.now())
                            };

                            await BaseCreate().makeApiCall("/exams/apply", body: body);

                            Get.toNamed("/exam");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Palette.kToDark),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text("Apply",
                                style: TextStyle(
                                    letterSpacing: 2, fontSize: 20, color: Colors.grey[200]))
                          ]),
                        )),
                  ],
                )),
          ));
  }
}
