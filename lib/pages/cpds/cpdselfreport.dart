// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/categories.dart';
import 'package:aya2/controllers/cpds/cpdselfreport.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/screens/pagecontainer.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CpdSelfReportPage extends StatefulWidget {
  const CpdSelfReportPage({Key? key}) : super(key: key);

  @override
  _CpdSelfReportPageState createState() => _CpdSelfReportPageState();
}

class _CpdSelfReportPageState extends State<CpdSelfReportPage> {
  String? indexId;
  // String? categoryId;
  String? category;
  DateTime? eventDate;
  String? eventTitle;
  String? eventLocation;
  PlatformFile? cpdEvidence;

  bool? isLoading = false;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  CategoriesController categories = Get.put(CategoriesController());

  final activityController = TextEditingController();
  final dateController = TextEditingController();
  final login = Get.find<AuthenticatedUserController>();

  // Future pickCpdEvidence() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;

  //     final tempImage = File(image.path);
  //     setState(() {
  //       cpdEvidence = tempImage;
  //     });
  //   } on Exception catch (e) {
  //     showDialogFail("error", e);
  //     print(e);
  //   }
  // }

  Future pickCpdEvidence() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpeg',
        'png',
        'jpg',
      ],
    );

    if (result != null) {
      setState(() {
        cpdEvidence = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CPD Self Reporting")),
        // appBar: AppBar(
        //     title: Text("Profile"),
        //     automaticallyImplyLeading: false,
        //     leading: IconButton(
        //       icon: Icon(Icons.arrow_back),
        //       onPressed: () {
        //         // {
        //         //   Get.back();
        //         // }
        //       },
        //     ),
        //     actions: [
        //       PopupMenuButton(
        //           icon: Icon(Icons.more_vert),
        //           itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        //                 PopupMenuItem(
        //                   child: TextButton(
        //                       onPressed: () {
        //                         Get.toNamed(
        //                           "/mycpd",
        //                         );
        //                       },
        //                       child: Text("My CPDs")),
        //                 ),
        //               ])
        //     ]),
        body: Obx(() => categories.isLoading.value
            ? ButtonLoaderWhite()
            : categories.isLoading.value
                ? Center(
                    child: SpinKitCircle(
                      color: Color.fromARGB(255, 1, 17, 31),
                      size: 50.0,
                    ),
                  )
                : int.parse('${login.data.value.cpd!.single.currentPoints!}') <
                        int.parse(
                            '${login.data.value.cpd!.single.cpdRequirement!}')
                    ? centerText(
                        "You are currently not elligible to self report. Current CPD points is below ${login.data.value.cpd!.single.cpdRequirement!}",
                      )
                    : pageContainer(
                        Form(
                          key: _formKey,
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  onChanged: (value) async {
                                    category = value;
                                  },
                                  validator: (value) => value == null
                                      ? 'Please select category'
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: "Select Category",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  items: categories.categories.value
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.categoryId,
                                      child: Text("${value.category}",
                                          overflow: TextOverflow.fade),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime.now())
                                      .then((date) =>
                                          setState(() => eventDate = date)),
                                  child: Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Event Date: ",
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                eventDate == null
                                                    ? ""
                                                    : formatter
                                                        .format(eventDate!),
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                )),
                                          )
                                        ],
                                      ))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  // controller: activityController,
                                  maxLines: 1,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1000),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Event Title",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    eventTitle = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter event title";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  // controller: activityController,
                                  maxLines: 1,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3000),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Event Location",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 5.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    eventLocation = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter event location";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    await pickCpdEvidence();
                                  },
                                  child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                          // filled: true,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Center(
                                        child: ListTile(
                                            leading: Icon(
                                                FontAwesomeIcons.fileImage,
                                                size: 40),
                                            // : ClipRRect(
                                            //     borderRadius:
                                            //         BorderRadius.circular(
                                            //             8.0),
                                            //     child: Image.file(
                                            //         cpdEvidence)
                                            //         ),
                                            title: cpdEvidence == null
                                                ? Text("Select CPD Evidence")
                                                : Text(cpdEvidence!.name)),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (cpdEvidence != null) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // print(category);
                                        Map<String, String> body = {
                                          'index_id': login.data.value.id!,
                                          'category_id': category!,
                                          'event_date':
                                              formatter.format(eventDate!),
                                          'event_title': eventTitle!,
                                          'event_location': eventLocation!,
                                        };
                                        await BaseCreate().makeAPICallWithImage(
                                            "/CPD/selfreport",
                                            body,
                                            "cpd_evidence",
                                            cpdEvidence!);
                                        setState(() {
                                          isLoading = false;
                                          Get.offAndToNamed('/');
                                        });
                                      } else {
                                        showDialogFail(
                                            "Error", "Please select image");
                                      }
                                    }
                                  },
                                  child: Text(isLoading == true
                                      ? "Loading..."
                                      : "Report"),
                                ),
                              )
                              // InkWell(
                              //   onTap: () async {
                              //     if (_formKey.currentState!.validate()) {
                              //       // if (category != null) {
                              //       // Get.back();
                              //       await cpds.cpdSelfReport(
                              //           category,
                              //           formatter.format(eventDate!),
                              //           eventTitle,
                              //           eventLocation,
                              //           cpdEvidence);
                              //     }
                              //   },
                              //   child: Container(
                              //       alignment: Alignment.center,
                              //       height: 50,
                              //       width: double.infinity,
                              //       margin: EdgeInsets.all(10),
                              //       decoration: BoxDecoration(
                              //           color: Colors.blue.shade900,
                              //           borderRadius:
                              //               BorderRadius.all(Radius.circular(15))),
                              //       child: Obx(() => Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 cpds.isLoading.value
                              //                     ? ButtonLoader()
                              //                     : SizedBox(),
                              //                 Icon(FontAwesomeIcons.shareSquare,
                              //                     color: Colors.white),
                              //                 SizedBox(width: 10),
                              //                 Text("Report",
                              //                     style: TextStyle(
                              //                         letterSpacing: 2,
                              //                         fontSize: 20,
                              //                         color: Colors.white))
                              //               ]))),
                              // ),
                            ],
                          ),
                        ),
                      )));
  }
}

class CategoriesData {
  call(int index) {
    CategoriesController controller = Get.find();
    return controller.categories.value;
  }
}
