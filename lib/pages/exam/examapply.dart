// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/exams/examapply.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';

class ExamApplyPage extends StatelessWidget {
  const ExamApplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(),
        appBar: AppBar(
          title: Text("Apply For Exam"),
          centerTitle: true,
        ),
        body: ExamApplyComponent());
  }
}
