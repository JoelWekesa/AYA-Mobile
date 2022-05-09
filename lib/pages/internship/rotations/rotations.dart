// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/internship/internshipareas.dart';
import 'package:aya2/controllers/internship/internshipget.dart';
import 'package:aya2/controllers/internship/rotation/rotationareas.dart';
import 'package:aya2/controllers/internship/rotation/rotationcompetencies.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotaionsPage extends StatefulWidget {
  const RotaionsPage({Key? key}) : super(key: key);

  @override
  _RotaionsPageState createState() => _RotaionsPageState();
}

class _RotaionsPageState extends State<RotaionsPage> {
  String? internshipAreaId;
  String? id;

  InternshipAreasController controller = Get.put(InternshipAreasController());
  RotationAreasController rotations = Get.put(RotationAreasController());
  InternshipGetController internship = Get.put(InternshipGetController());
  RotationCompetenciesController competencies =
      Get.put(RotationCompetenciesController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value || internship.isLoading.value
        ? ButtonLoaderWhite()
        : internship.data.value.isEmpty
            ? centerText("You do not have any internships")
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        onChanged: (value) async {
                          internshipAreaId = value;
                          await rotations.rotationAreas(int.parse(value!));
                        },
                        validator: (value) => value == null
                            ? 'Please select internship area'
                            : null,
                        decoration: InputDecoration(
                          labelText: "Select Internship Area",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0),
                          ),
                        ),
                        // items: controller.areas.value.internshipAreas!
                        items: controller.areas.value
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.internshipAreaId,
                            child: Text("${value.internshipArea}",
                                overflow: TextOverflow.fade),
                          );
                        }).toList(),
                      ),
                    ),
                    rotations.success.value && !rotations.isLoading.value
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    rotations.data.value.rotationAreas!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        print(rotations.data.value
                                            .rotationAreas![index].rotationId);
                                        int length =
                                            internship.data.value.length - 1;
                                        id = (internship
                                            .data.value[length].internshipId);

                                        setState(() {});

                                        await competencies.getCompetencies(
                                            rotations
                                                .data
                                                .value
                                                .rotationAreas![index]
                                                .rotationId);

                                        Get.toNamed("/rotationcompetencies",
                                            arguments: {
                                              "internshipId": id,
                                              "rotationId": controller
                                                  .areas
                                                  .value
                                                  // .internshipAreas![index]
                                                  [index]
                                                  .internshipAreaId
                                            });
                                      }
                                    },
                                    child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Rotation Area: ",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${rotations.data.value.rotationAreas![index].rotationArea}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Wrap(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Rotation Duration: ",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${rotations.data.value.rotationAreas![index].rotationDuration}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  );
                                },
                              ),
                            ),
                          )
                        : rotations.isLoading.value
                            ? ButtonLoaderWhite()
                            : SizedBox(),
                  ],
                ),
              ));
  }
}
