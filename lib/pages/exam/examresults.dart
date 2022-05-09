// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/exam/examresults.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
// import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamResultsPage extends StatefulWidget {
  const ExamResultsPage({Key? key}) : super(key: key);

  @override
  _ExamResultsPageState createState() => _ExamResultsPageState();
}

class _ExamResultsPageState extends State<ExamResultsPage> {
  ExamResultController controller = Get.put(ExamResultController());
  LoginController login = Get.find();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  var examresults = ExamResultData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "CPD History"),
      body: RefreshIndicator(
        onRefresh: () => controller.getResults(login.data.value.id),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.examresults.value.isEmpty
                ? centerText("You do not have any recorded EXAM results.")
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
                                hintText: "Search Exam Series",
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
                            itemCount: controller.examresults.value.length,
                            // ? 0
                            // : controller.examresults.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller.examresults[index].series
                                      .toString()
                                      .contains(searchString.toUpperCase())
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Exam Series
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Exam Series",
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
                                                      examresults(index)
                                                                  .series !=
                                                              null
                                                          ? "${examresults(index).series}"
                                                              .replaceAll(
                                                                  "series.", "")
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
                                              //exam Number
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Exam Number",
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
                                                      examresults(index)
                                                                  .examNo !=
                                                              null
                                                          ? "${examresults(index).examNo}"
                                                              .replaceAll(
                                                                  "examNo.", "")
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
                                              //Institution
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Training Institution",
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
                                                      examresults(index)
                                                                  .trainingInstitution !=
                                                              null
                                                          ? "${examresults(index).trainingInstitution}"
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
                                              //cadre
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Cadre",
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
                                                      examresults(index)
                                                                  .cadre !=
                                                              null
                                                          ? "${examresults(index).cadre}"
                                                              .replaceAll(
                                                                  "Cadre.", "")
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
                                              //grading method
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Grading Method",
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
                                                      examresults(index)
                                                                  .gradingMethod !=
                                                              null
                                                          ? "${examresults(index).gradingMethod}"
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
                                              //Score paper one
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Score Paper One",
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
                                                      examresults(index)
                                                                  .scorePaperOne !=
                                                              null
                                                          ? "${examresults(index).scorePaperOne}"
                                                              // .toString()
                                                              // .substring(18)
                                                              .replaceAll(
                                                                  "ScorePaperOne.",
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
                                                      )),
                                                ),
                                              ),
                                              //Score paper two
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Score Paper Two",
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
                                                      examresults(index)
                                                                  .scorePaperTwo !=
                                                              null
                                                          ? "${examresults(index).scorePaperTwo}"
                                                              .replaceAll(
                                                                  "ScorePaperTwo.",
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
                                              //overall score
                                              SizedBox(height: 5),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Overall Score",
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
                                                      examresults(index)
                                                                  .overallScore !=
                                                              null
                                                          ? "${examresults(index).overallScore}"
                                                              .replaceAll(
                                                                  "OverallScore.",
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

class ExamResultData {
  call(int index) {
    ExamResultController controller = Get.find();
    controller.examresults.value.sort((a, b) => b.series!.compareTo(a.series!));
    return controller.examresults.value[index];
  }
}
