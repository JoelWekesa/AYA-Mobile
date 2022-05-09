// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/components/exams/examhistory.dart';
import 'package:aya2/components/exams/examresults.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ExamComboPage extends StatelessWidget {
  const ExamComboPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: mainDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: Theme.of(context).textTheme.bodyText1,
              labelColor: Colors.grey[100],
              indicatorColor: Colors.amber,
              tabs: [Tab(child: Text("Results")), Tab(child: Text("History"))],
            ),
            title: Text("Exams"),
            // centerTitle: true,
          ),
          body: TabBarView(
            children: [
              ExamResultsComponent(),
              ExamHistoryComponent(),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed("/examseries");
            },
            label: const Text('Apply Exam'),
            icon: const Icon(FontAwesomeIcons.plus),
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child:
            //       Text("Apply", style: Theme.of(context).textTheme.bodyText2),
            // )
          ),
        ));
  }
}
