// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/faq/addfaq.dart';
import 'package:aya2/components/faq/faqs.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(),
      appBar: AppBar(
        title: Text("FAQs"),
        centerTitle: true,
      ),
      body: FAQScreen(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.bottomSheet(AddFAQScreen()),
          child: Icon(FontAwesomeIcons.plus)),
    );
  }
}
