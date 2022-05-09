// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/knowbase/kbase.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SubArticlesComponent extends StatelessWidget {
  const SubArticlesComponent({Key? key}) : super(key: key);

  final url = "https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf";

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    KBaseController controller = Get.put(KBaseController());
    return Column(
      children: [
        // InkWell(onTap: () => _launchURL(), child: customContainer(launchPdf(context))),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: TextFormField(
        //       autocorrect: false,
        //       onChanged: (value) async {
        //         if (value.length > 3) {
        //           await controller.getAllSubArticles(value);
        //         } else if (value.isEmpty) {
        //           await controller.getAllSubArticles("");
        //         }
        //       },
        //       decoration: InputDecoration(
        //           filled: true,
        //           fillColor: Colors.white,
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(25.0),
        //           ),
        //           prefixIcon: Icon(FontAwesomeIcons.search),
        //           label: Text("Search"))),
        // ),
        Obx(() => controller.isLoading.value
            ? Expanded(
                child:
                    Center(child: Text("Loading...", style: Theme.of(context).textTheme.bodyText1)))
            : Expanded(
                child: RefreshIndicator(
                  onRefresh: () => controller.getAllItems(),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            _launchURL("https://aya-api.mhealthkenya.co.ke/uploads/" +
                                controller.data[index].content!);
                          },
                          child:
                              customContainer(articleComponent(controller.data[index], context)));
                    },
                  ),
                ),
              ))
      ],
    );
  }
}

Widget launchPdf(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Sample and Demo PDF", style: Theme.of(context).textTheme.headline2)),
      ),
      Divider(color: Palette.kToDark),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            "This is a sample PDF file. You can open it by clicking anywhere on this container. This will open up a PDF viewer in your default browser. From the pdf viewer, you can also download the file, print it, or search for text in the file. Thank you for using Aya!",
            style: Theme.of(context).textTheme.bodyText1),
      ),
    ],
  );
}

Widget articleComponent(article, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            article.title!,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(color: Palette.kToDark),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(article.subtitle!,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left),
          ),
        ),
      ],
    ),
  );
}
