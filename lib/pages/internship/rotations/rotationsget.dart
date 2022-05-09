// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/internship/rotation/rotationsget.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RotationgetPage extends StatefulWidget {
  const RotationgetPage({Key? key}) : super(key: key);

  @override
  _RotationgetPageState createState() => _RotationgetPageState();
}

class _RotationgetPageState extends State<RotationgetPage> {
  // RotationGetController controller = Get.find();
  RotationGetController controller = Get.put(RotationGetController());
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var rotations = RotationsData();

  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: mainDrawer(),

        appBar: AppBar(
          title: Text("Rotations"),
        ),
        body: RefreshIndicator(
          onRefresh: () async => await controller.getRotation(),
          child: Obx(() => controller.isLoading.value
              ? Center(child: ButtonLoaderWhite())
              : controller.rotation.value.isEmpty
                  ? centerText("You do not have any rotations")
                  : Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              alignment: Alignment.center,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: TextField(
                                textCapitalization: TextCapitalization.words,
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {
                                    searchString = value;
                                  });
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText:
                                      "Search internship center here, cap sensitive",
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: InputBorder.none,
                                  // labelText:
                                  //     "Search internship center here, cap sensitive",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    // color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: ScrollPhysics(),
                              itemCount: controller.rotation.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return controller
                                        .rotation[index].internshipCenter
                                        .toString()
                                        .contains(searchString)
                                    ? Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.6),
                                                    spreadRadius: 8,
                                                    blurRadius: 6,
                                                    offset: Offset(0,
                                                        4), // changes position of shadow
                                                  ),
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 179, 198, 249),
                                                    Color.fromARGB(
                                                        255, 237, 243, 236),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                color: Colors.blue.shade50,
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 156, 164, 179)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Internship Centre
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Internship Centre",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          "${rotations(index).internshipCenter}",
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                  //intetnship area
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Internship Area",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          rotations(index)
                                                              .internshipArea
                                                              .toString()
                                                              .substring(15),
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                  //Rotation area
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Rotation Area",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          rotations(index)
                                                              .rotationArea
                                                              .toString()
                                                              .substring(13),
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                  //competency
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Competency",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          "${rotations(index).competency}",
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                  //activity notes
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Activity Notes",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          "${rotations(index).activityNotes}",
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                  //activity  Date
                                                  SizedBox(height: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Activity Date",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark)))),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 30,
                                                      child: Text(
                                                          rotations(index)
                                                                      .activityDate !=
                                                                  null
                                                              ? formatter.format(
                                                                  DateTime.parse(
                                                                      "${rotations(index).activityDate}"))
                                                              : 'Not Available',
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
        ));
  }
}

class RotationsData {
  call(int index) {
    RotationGetController controller = Get.find();
    controller.rotation.value
        .sort((a, b) => b.activityDate!.compareTo(a.activityDate!));
    return controller.rotation.value[index];
  }
}
