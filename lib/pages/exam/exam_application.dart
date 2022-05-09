// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/examapphist.dart';
import 'package:aya2/controllers/examseries.dart';
import 'package:aya2/controllers/network.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/screens/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/auth/authenticated.dart';
import 'package:aya2/utils/tab_text.dart';

class ExamApplicationPage extends StatefulWidget {
  const ExamApplicationPage({Key? key}) : super(key: key);

  @override
  State<ExamApplicationPage> createState() => _ExamApplicationPageState();
}

class _ExamApplicationPageState extends State<ExamApplicationPage> {
  NetworkController network = Get.put(NetworkController());
  ExamSeriesController series = Get.put(ExamSeriesController());

  var allSeries = SeriesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam Apply")),
        backgroundColor: Colors.white,
        body: Obx(
          () => series.isLoading.value
              ? ButtonLoaderWhite()
              : ListView.builder(
                  itemCount: series.data.value.length, //this is null
                  //itemCount: series.data.value.message!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => {
                        Get.toNamed("/examsapply", arguments: allSeries(index).studentSeriesId)
                        // if (allSeries(index).applicationStatus == "open")
                        //   {Get.toNamed("/examsapply", arguments: allSeries(index).studentSeriesId)}
                        // else
                        //   {showDialogFail("Error", "Application closed")}
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: SizedBox(
                                        height: 30,
                                        child: Text("Exam Series",
                                            style: TextStyle(color: Colors.grey)))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: Text("${allSeries(index).examsSeries}",
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                        style: TextStyle(
                                            color: allSeries(index).applicationStatus == "closed"
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: SizedBox(
                                        height: 30,
                                        child:
                                            Text("Cadre", style: TextStyle(color: Colors.grey)))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: Text(
                                        "${allSeries(index).cadre}".replaceAll("Employer.", ""),
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                        style: TextStyle(
                                            color: allSeries(index).applicationStatus == "closed"
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: SizedBox(
                                        height: 30,
                                        child:
                                            Text("Status", style: TextStyle(color: Colors.grey)))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: Text(
                                        "${allSeries(index).applicationStatus}"
                                            .replaceAll("WorkstationName.", ""),
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                        style: TextStyle(
                                            color: allSeries(index).applicationStatus == "closed"
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}

class SeriesData {
  call(int index) {
    ExamSeriesController controller = Get.find();
    return controller.data.value[index];
    //return controller.data.value.message![index];
  }
}
