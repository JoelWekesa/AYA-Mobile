// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/controllers/internship/internship_transfer_get.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:aya2/controllers/internship/internship_transfer_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransferHistPage extends StatefulWidget {
  const TransferHistPage({Key? key}) : super(key: key);

  @override
  _TransferHistPageState createState() => _TransferHistPageState();
}

class _TransferHistPageState extends State<TransferHistPage> {
  InternshipGetTransferController controller =
      Get.put(InternshipGetTransferController());
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var transfer = TransferData();

  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfers")),
      body: RefreshIndicator(
        onRefresh: () async => await controller.getInternshipTransfer(),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.data.value.isEmpty
                ? centerText("You do not have any transfer requests")
                : Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            alignment: Alignment.center,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: TextField(
                              textCapitalization: TextCapitalization.words,
                              cursorColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  searchString = value;
                                });
                              },
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText:
                                    "Search internship center here, cap sensitive",
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                border: InputBorder.none,
                                // labelText:
                                //     "Search internship center here, cap sensitive",
                                prefixIcon: Icon(
                                  Icons.search,
                                  // color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                            itemCount: controller.data.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller.data[index].centerTo!
                                      .contains(searchString)
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      // elevation: 5,
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  spreadRadius: 8,
                                                  blurRadius: 6,
                                                  offset: Offset(0,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 179, 198, 249),
                                                  Color.fromARGB(
                                                      255, 237, 243, 236),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                              color: Colors.blue.shade50,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 156, 164, 179)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //Transfer Reason description
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                              "Transfer Reason description",
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .kToDark))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            transfer(index)
                                                                .transferReasonDesc
                                                                .toString()
                                                                .substring(19),
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //Request Date
                                                    SizedBox(height: 5),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: SizedBox(
                                                            height: 30,
                                                            child: Text(
                                                                "Request Date",
                                                                style: TextStyle(
                                                                    color: Palette
                                                                        .kToDark)))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            formatter.format(
                                                                DateTime.parse(
                                                                    "${transfer(index).requestDate}")),
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //centre from
                                                    SizedBox(height: 5),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: SizedBox(
                                                            height: 30,
                                                            child: Text(
                                                                "Centre From",
                                                                style: TextStyle(
                                                                    color: Palette
                                                                        .kToDark)))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 280,
                                                        height: 30,
                                                        child: Text(
                                                            transfer(index)
                                                                .centerFrom
                                                                .toString()
                                                                .substring(11),
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //centre to
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                          "Centre To",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            "${transfer(index).centerTo}",
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    //application Status
                                                    SizedBox(height: 5),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                          "Application Status",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 30,
                                                        child: Text(
                                                            transfer(index)
                                                                .applicationStatus
                                                                .toString()
                                                                .substring(18),
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )))
                                  : Container();
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}

class TransferData {
  call(int index) {
    InternshipGetTransferController controller = Get.find();
    controller.data.value
        .sort((a, b) => b.requestDate!.compareTo(a.requestDate!));
    return controller.data.value[index];
  }
}
