// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/internship/competency.dart';
import 'package:aya2/controllers/internship/internshipareas.dart';
import 'package:aya2/controllers/internship/rotation/rotationareas.dart';
import 'package:aya2/controllers/internship/rotation/rotationsget.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompetencyPage extends StatefulWidget {
  const CompetencyPage({Key? key}) : super(key: key);

  @override
  _CompetencyPageState createState() => _CompetencyPageState();
}

class _CompetencyPageState extends State<CompetencyPage> {
  String? rotationId;
  var data = Get.arguments;
  InternshipAreasController areas = Get.put(InternshipAreasController());
  RotationGetController rotations = Get.put(RotationGetController());
  RotationAreasController rareas = Get.put(RotationAreasController());
  CompetencySummaryController competencies =
      Get.put(CompetencySummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Competencies Summary"),
        body: Obx(() => rotations.isLoading.value
            ? ButtonLoaderWhite()
            : areas.isLoading.value
                ? ButtonLoaderWhite()
                : ListView(children: [
                    Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            onChanged: (value) async {
                              await rareas.rotationAreas(int.parse(value!));
                            },
                            validator: (value) => value == null
                                ? 'Please select education'
                                : null,
                            decoration: InputDecoration(
                              labelText: "Select Internship Area",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 5.0),
                              ),
                            ),
                            // items: areas.areas.value.internshipAreas!
                            items: areas.areas.value
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                value: value.internshipAreaId,
                                child: Text("${value.internshipArea}",
                                    overflow: TextOverflow.fade),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )),
                    rareas.isLoading.value
                        ? ButtonLoaderWhite()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: rareas.data.value.rotationAreas == null
                                ? 0
                                : rareas.data.value.rotationAreas!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () async {
                                  await competencies.getComptenciesSummary(
                                      data,
                                      rareas.data.value.rotationAreas![index]
                                          .rotationId!);
                                  Get.toNamed("/competencysummary", arguments: {
                                    "internshipId": data,
                                    "internshipRotationId": rareas.data.value
                                        .rotationAreas![index].rotationId
                                  });
                                },
                                child: Card(
                                  child: ListTile(
                                      title: Text(rareas
                                          .data
                                          .value
                                          .rotationAreas![index]
                                          .rotationArea!)),
                                ),
                              );
                            },
                          ),
                  ])));
  }
}
