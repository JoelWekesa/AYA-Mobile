// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors

import 'package:aya2/controllers/faq/allfaq.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/faqs.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  static FAQController faqs = Get.put(FAQController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => faqs.isLoading.value
        ? Center(child: Text("Loading...", style: Theme.of(context).textTheme.bodyText1))
        : RefreshIndicator(
            onRefresh: () => faqs.getAllFaQs(),
            child: ListView.builder(
              itemCount: faqs.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Get.toNamed('/singlefaq', arguments: faqs.data[index]);
                    },
                    child: customContainer(FAQContent(faqs.data[index], context, faqs)));
              },
            ),
          ));
  }
}

Widget FAQContent(FaQsModel item, BuildContext context, FAQController faqs) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.title!, style: Theme.of(context).textTheme.headline2),
          )),
          IconButton(
              onPressed: () async {
                String method = "DELETE";
                String url = "/faqs/${item.id}";
                await BaseResponse().makeApiCall(method, url);
                await faqs.getAllFaQs();
              },
              icon: Icon(FontAwesomeIcons.trash),
              color: Palette.kToDark)
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(item.content!, style: Theme.of(context).textTheme.bodyText1),
      // ),
    ],
  );
}

Widget FAQContentSingle(FaQsModel item, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.title!, style: Theme.of(context).textTheme.headline2),
          )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item.content!, style: Theme.of(context).textTheme.bodyText1),
      ),
    ],
  );
}
