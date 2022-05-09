// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/exams/examseries.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';

class ExamSeriesPage extends StatelessWidget {
  const ExamSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Exam Series"),
          centerTitle: true,
        ),
        drawer: mainDrawer(),
        body: ExamSeriesComponent());
  }
}
