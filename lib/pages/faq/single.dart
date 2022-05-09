// ignore_for_file: prefer_const_constructors

import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/faq/faqs.dart';

class SingleFAQ extends StatelessWidget {
  const SingleFAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        centerTitle: true,
      ),
      body: customContainer(FAQContentSingle(data, context)),
    );
  }
}
