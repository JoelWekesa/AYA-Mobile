// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/components/exams/examhistory.dart';
import 'package:aya2/components/exams/examresults.dart';
import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/pages/exam/exam_application.dart';
import 'package:aya2/pages/exam/exam_history.dart';
import 'package:aya2/pages/exam/examresults.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamsPage extends StatefulWidget {
  const ExamsPage({Key? key}) : super(key: key);

  @override
  State<ExamsPage> createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> with TickerProviderStateMixin {
  // late TabController _tabController;
  TabController? _tabController;

  AuthenticatedUserController authUser = Get.put(AuthenticatedUserController());

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(),
        appBar: AppBar(
          title: Text("Exams"),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.amberAccent,
            isScrollable: true,
            tabs: const [
              Tab(child: Text('History')),
              Tab(child: Text('Results')),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: const [
            Center(
              child: ExamHistoryPage(),
            ),
            Center(
              child: ExamResultsPage(),
            ),
            ExamHistoryComponent(),
          ],
          controller: _tabController,
        ));
  }
}
