// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/counties.dart';
import 'package:aya2/controllers/employers.dart';
import 'package:aya2/controllers/licence/licence_application.dart';
import 'package:aya2/controllers/workstationbycounty.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/screens/pagecontainer.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:aya2/controllers/auth/authenticated.dart';

class LicenceApplicationsPage extends StatefulWidget {
  const LicenceApplicationsPage({Key? key}) : super(key: key);

  @override
  _LicenceApplicationsPageState createState() =>
      _LicenceApplicationsPageState();
}

class _LicenceApplicationsPageState extends State<LicenceApplicationsPage> {
  String? indexId;
  DateTime? renewalDate;
  String? workstationId;
  String? employer;
  String? county;
  String? workstation;

  bool? isLoading = false;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  CountiesController counties = Get.put(CountiesController());
  // WorkStationsController workstations = Get.put(WorkStationsController());
  WorkStationbyCountyController workstations =
      Get.put(WorkStationbyCountyController());
  EmployersController employers = Get.put(EmployersController());
  LicenceApplyController apply = Get.put(LicenceApplyController());
  AuthenticatedUserController authenticatedUser =
      Get.put(AuthenticatedUserController());
  final activityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: CustomAppBar(title: "Licence Application"),
        body: Obx(() => counties.isLoading.value
            ? ButtonLoaderWhite()
            : counties.isLoading.value
                ? ButtonLoaderWhite()
                : employers.isLoading.value
                    ? Center(
                        child: ButtonLoaderWhite(),
                      )
                    : int.parse(authenticatedUser
                                .data.value.cpd!.single.currentPoints!) <
                            int.parse(authenticatedUser
                                .data.value.cpd!.single.cpdRequirement!)
                        ? centerText(
                            "You are currently not elligible to apply. Current CPD points is below ${authenticatedUser.data.value.cpd!.single.cpdRequirement!}",
                          )
                        : pageContainer(Form(
                            key: _formKey,
                            child: ListView(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  onChanged: (value) async {
                                    county = value;
                                    await workstations
                                        .getWorkStationsbycounty(value);
                                  },
                                  validator: (value) => value == null
                                      ? 'Please select a county'
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: "Select County",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  items: counties.counties.value
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.id,
                                      child: Text("${value.county}",
                                          overflow: TextOverflow.fade),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  onChanged: (value) async {
                                    workstation = value;
                                  },
                                  validator: (value) => value == null
                                      ? 'Please select a workstation'
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: "Select Workstation",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  items: workstations.workstations.value
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: '${value.id}'
                                          '/'
                                          '${value.workstation}',
                                      child: Text("${value.workstation}",
                                          overflow: TextOverflow.fade),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  onChanged: (value) async {
                                    employer = value;
                                  },
                                  validator: (value) => value == null
                                      ? 'Please select an Employer'
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: "Select an employer",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  items: employers.employers.value
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.id,
                                      child: Text("${value.employer}",
                                          overflow: TextOverflow.fade),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (workstation != null) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // print(workstation);
                                        Map<String, String> body = {
                                          'index_id':
                                              authenticatedUser.data.value.id!,
                                          'renewal_date':
                                              formatter.format(DateTime.now()),
                                          'workstation_id': workstation
                                              .toString()
                                              .split('/')
                                              .elementAt(0),
                                          'employer_id': employer!,
                                          'county_id': county!,
                                          'workstation_name': workstation
                                              .toString()
                                              .split('/')
                                              .elementAt(1)
                                        };
                                        await BaseCreate().makeApiCall(
                                            "/licencing",
                                            body: body);
                                        setState(() {
                                          isLoading = false;
                                          Get.offAndToNamed('/');
                                        });
                                      } else {
                                        showDialogFail(
                                            "Error", 'Please fill all feilds');
                                      }
                                    }
                                  },
                                  child: Text(isLoading == true
                                      ? "Loading..."
                                      : "Apply"),
                                  // child: Text("Apply"),
                                ),
                              )
                            ])))));
  }
}
