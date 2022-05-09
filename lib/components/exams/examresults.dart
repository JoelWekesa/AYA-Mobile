// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';

class ExamResultsComponent extends StatelessWidget {
  const ExamResultsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return customContainer(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Series",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("April 2022",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // resultDetails(context, title: "Series", value: "April 2022"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Index Number",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("12345",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Index Number", value: "12345"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Full Name",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("Test User Results",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context,
            //     title: "Full Name", value: "Test User Results"),
              SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Exam Number",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("12345",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Exam Number", value: "12345"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Institution",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("AKUHN",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Institution", value: "AKUHN"),
            SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Cadre",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: Text("KENYA REGISTERED COMMUNITY HEALTH NURSE [BASIC]",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context,
            //     title: "Cadre",
            //     value: "KENYA REGISTERED COMMUNITY HEALTH NURSE [BASIC]"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Grading Method",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("Minimum",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Grading Method", value: "Minimum"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Paper One",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("Pass",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Paper One", value: "Pass"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Paper Two",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("Fail",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Paper Two", value: "Fail"),
             SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                    height: 30,
                    child: Text("Overall",
                        style: TextStyle(color: Palette.kToDark)))),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 200,
                height: 30,
                child: Text("Pass",
                    // examresults(index)
                    //             .examNo !=
                    //         null
                    //     ? "${examresults(index).examNo}"
                    //         .replaceAll(
                    //             "examNo.", "")
                    //     : "Not Available",
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        color: Palette.kToDark, fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(height: 2),
            // Divider(color: Colors.grey),
            // resultDetails(context, title: "Overall", value: "Pass"),
          ],
        ));
      },
    );
  }
}

Column resultDetails(BuildContext context,
    {required String title, required String value}) {
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
