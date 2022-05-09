// ignore_for_file: prefer_const_constructors
//testing new branch chekin changes

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/internship/checkin/checkinget.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckinGetPage extends StatefulWidget {
  const CheckinGetPage({Key? key}) : super(key: key);

  @override
  _CheckinGetPageState createState() => _CheckinGetPageState();
}

class _CheckinGetPageState extends State<CheckinGetPage> {
  CheckinGetController controller = Get.put(CheckinGetController());

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var checkin = CheckinData();

  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkins")),
      body: RefreshIndicator(
        onRefresh: () => controller.getCheckins(),
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: ButtonLoaderWhite())
              : controller.data.value.isEmpty
                  ? centerText("You do not have any checkins")
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
                              itemCount: controller.data.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return controller.data[index].internshipCenter
                                        .toString()
                                        .contains(searchString)
                                    ? Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: double.infinity,
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
                                                colors: const [
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
                                          // elevation: 5,
                                          // shape: RoundedRectangleBorder(
                                          //     borderRadius: BorderRadius.all(
                                          //         Radius.circular(10))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //checkin date
                                                    SizedBox(height: 5),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: SizedBox(
                                                            height: 30,
                                                            child: Text(
                                                                "Checkin Date",
                                                                style: TextStyle(
                                                                    color: Palette
                                                                        .kToDark)))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                          formatter.format(
                                                              DateTime.parse(
                                                                  "${checkin(index).checkinDate}")),
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    //nurse officer incharge
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Nurse Officer Incharge",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            "${checkin(index).nurseOfficerIncharge}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //Nurse Officer Phone No.
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Nurse Incharge Mobile",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            "${checkin(index).nurseOfficerInchargeMobile}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //Supervisor
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Supervisor",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            "${checkin(index).supervisor}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //Supervisor Mobile
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Supervisor Mobile",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            "${checkin(index).supervisorMobile}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //internship center
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Internship Center",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 30,
                                                        child: Text(
                                                          checkin(index)
                                                              .internshipCenter
                                                              .toString()
                                                              .substring(17),
                                                          maxLines: 3,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    : Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}

class CheckinData {
  call(int index) {
    CheckinGetController controller = Get.find();
    controller.data.value
        .sort((a, b) => b.checkinDate!.compareTo(a.checkinDate!));
    return controller.data.value[index];
  }
}
