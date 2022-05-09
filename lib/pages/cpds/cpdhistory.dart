// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/cpds/cpdhistory.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
// import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CpdHistory extends StatefulWidget {
  const CpdHistory({Key? key}) : super(key: key);

  @override
  _CpdHistoryState createState() => _CpdHistoryState();
}

class _CpdHistoryState extends State<CpdHistory> {
  CpdGetController controller = Get.put(CpdGetController());
  LoginController login = Get.find();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  var cpds = CpdData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "CPD History"),
      body: RefreshIndicator(
        onRefresh: () => controller.getCpds(login.data.value.id),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.cpds.value.isEmpty
                ? centerText("You do not have any recorded CPD activities.")
                : Expanded(
                    // padding: const EdgeInsets.all(8.0),
                    // child: Expanded(
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
                                hintText: "Search Activity Location",
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                border: InputBorder.none,
                                // labelText:
                                //     "Search Activity Location, Case Sensitive",
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
                            itemCount: controller.cpds.value.length,
                            // ? 0
                            // : controller.cpds.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller.cpds[index].activityLocation
                                      .toString()
                                      .contains(searchString.toLowerCase())
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Provider",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).provider !=
                                                              null
                                                          ? "${cpds(index).provider}"
                                                              .replaceAll(
                                                                  "Provider.",
                                                                  "")
                                                              .replaceAll(
                                                                  "_", " ")
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              //activity category
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Acivity Category",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).activityCategory !=
                                                              null
                                                          ? "${cpds(index).activityCategory}"
                                                              .replaceAll(
                                                                  "ActivityCategory.",
                                                                  "")
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              //Activity
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Acivity",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).activity !=
                                                              null
                                                          ? "${cpds(index).activity}"
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              //Activity Location
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Acivity Location",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).activityLocation !=
                                                              null
                                                          ? "${cpds(index).activityLocation}"
                                                              .replaceAll(
                                                                  "ActivityLocation.",
                                                                  "")
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              //Activity Date
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Acivity Date",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).activityDate !=
                                                              null
                                                          ? formatter.format(
                                                              DateTime.parse(
                                                                  "${cpds(index).activityDate}"))
                                                          : 'Not Available',
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              // Activity Evodence
                                              // SizedBox(height: 5),
                                              // Padding(
                                              //     padding:
                                              //         const EdgeInsets.only(
                                              //             left: 8, right: 8),
                                              //     child: SizedBox(
                                              //         height: 30,
                                              //         child: Text(
                                              //             "Acivity Evidence",
                                              //             style: TextStyle(
                                              //                 color: Colors
                                              //                     .grey)))),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 8, right: 8),
                                              //   child: SizedBox(
                                              //     width: 200,
                                              //     height: 30,
                                              //     child: Text(
                                              //         cpds(index).activityEvidence !=
                                              //                 null
                                              //             ? "${cpds(index).activityEvidence}"
                                              //             : "Not Available",
                                              //         maxLines: 3,
                                              //         overflow:
                                              //             TextOverflow.clip,
                                              //         softWrap: true,
                                              //         style: TextStyle(
                                              //             fontWeight:
                                              //                 FontWeight.bold)),
                                              //   ),
                                              // ),
                                              // Points earned
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Points Earned",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).pointsEarned !=
                                                              null
                                                          ? "${cpds(index).pointsEarned}"
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                              //Approval status
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Approval Status",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).approvalStatus !=
                                                              null
                                                          ? "${cpds(index).approvalStatus}"
                                                              // .toString()
                                                              // .substring(18)
                                                              .replaceAll(
                                                                  "ApprovalStatus.",
                                                                  "")
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        color: Palette.kToDark,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // color: cpds(index)
                                                        //             .approvalStatus ==
                                                        //         CpdStatus()
                                                        //             .underReview
                                                        //     ? Colors.grey
                                                        //     : Colors.amber
                                                      )),
                                                ),
                                              ),
                                              //Approval comments
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Approval Comments",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark)))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 30,
                                                  child: Text(
                                                      cpds(index).approvalComments !=
                                                              null
                                                          ? "${cpds(index).approvalComments}"
                                                              .replaceAll(
                                                                  "ApprovalComments.",
                                                                  "")
                                                              .replaceAll(
                                                                  "_", " ")
                                                          : "Not Available",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color:
                                                              Palette.kToDark,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                              // ignore: prefer_const_literals_to_create_immutables
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
                                      ),
                                    )
                                  : Container();
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   elevation: 0.0,
      //   onPressed: () {
      //     Get.toNamed(
      //       "/selfreport",
      //     );
      //   },
      //   label: const Text('Add CPD'),
      //   icon: const Icon(FontAwesomeIcons.plus),
      //   // child: Text("Add CPD",
      //   //     style: TextStyle(
      //   //       color: Colors.white,
      //   //       fontWeight: FontWeight.bold,
      //   //     ))
      //   // child: Image.asset('assets/icons8-self-service-48.png')
      // ),
    );
  }
}

class CpdStatus {
  final String underReview = "Under review";
}

class CpdData {
  call(int index) {
    CpdGetController controller = Get.find();
    controller.cpds.value
        .sort((a, b) => b.activityDate!.compareTo(a.activityDate!));
    return controller.cpds.value[index];
  }
}
