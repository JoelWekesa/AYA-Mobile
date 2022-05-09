// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/controllers/exam/examseries.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamSeriesComponent extends StatelessWidget {
  const ExamSeriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExamSeriesController controller = Get.put(ExamSeriesController());
    return Obx(() => controller.isLoading.value
        ? Center(
            child: Text(
            "Getting data",
            style: Theme.of(context).textTheme.bodyText1,
          ))
        : ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () =>
                    Get.toNamed("/examapply", arguments: controller.data[index].studentSeriesId),
                child: customContainer(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    seriesDetails(context,
                        title: "Series", value: controller.data[index].examsSeries!),
                    SizedBox(height: 2),
                    Divider(color: Colors.grey),
                    seriesDetails(context, title: "Cadre", value: controller.data[index].cadre!),
                    SizedBox(height: 2),
                    Divider(color: Colors.grey),
                    seriesDetails(context,
                        title: "Application Status",
                        value: controller.data[index].applicationStatus!),
                  ],
                )),
              );
            },
          ));
  }
}

Column seriesDetails(BuildContext context, {required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: Theme.of(context).textTheme.caption),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value, style: Theme.of(context).textTheme.bodyText1),
      ),
    ],
  );
}
