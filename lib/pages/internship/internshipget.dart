// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/internship/internship.dart';
import 'package:aya2/controllers/nckpayment.dart';
import 'package:aya2/controllers/pdf.dart';
import 'package:aya2/controllers/pdfinvoice.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:aya2/controllers/internship/internshipget.dart';
import 'package:aya2/models/invoice/invoice.dart';
import 'package:aya2/models/invoice/nck.dart';
import 'package:aya2/models/invoice/student.dart';
import 'package:aya2/screens/buttonloader.dart';

class InternshipGetPage extends StatefulWidget {
  const InternshipGetPage({Key? key}) : super(key: key);

  @override
  _InternshipGetPageState createState() => _InternshipGetPageState();
}

class _InternshipGetPageState extends State<InternshipGetPage> {
  InternshipGetController controller = Get.put(InternshipGetController());
  NCKPaymentController payment = Get.put(NCKPaymentController());
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  AuthenticatedUserController login = Get.find();

  var internship = InternshipData();

  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Internship History")),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getInternships();
        },
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.data.value.isEmpty ||
                    controller.data.value.first.amountDue == '' ||
                    controller.data.value.first.amountDue == null
                ? centerText(
                    "You do not have any internships",
                  )
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
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  searchString = value;
                                });
                              },
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText:
                                    "Search institution here, cap sensitive",
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                border: InputBorder.none,
                                // labelText:
                                //     "Search institution here, cap sensitive",
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
                              return controller.data[index].internshipCenter!
                                      .contains(searchString)
                                  ? Padding(
                                      // elevation: 5,
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.all(
                                      //         Radius.circular(10))),
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
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
                                        child: Stack(
                                          children: [
                                            // internship(index)
                                            //             .applicationStatus ==
                                            //         InternshipStatus()
                                            //             .underReview
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: PopupMenuButton(
                                                icon: Icon(Icons.more_vert),
                                                itemBuilder:
                                                    (BuildContext context) =>
                                                        <PopupMenuEntry>[
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              "/checkin",
                                                              arguments:
                                                                  internship(
                                                                      index));
                                                        },
                                                        child:
                                                            Text("Check In")),
                                                  ),
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              "/internshipadd",
                                                              arguments:
                                                                  internship(
                                                                      index));
                                                        },
                                                        child:
                                                            Text("Transfer")),
                                                  ),
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              "/competency",
                                                              arguments: internship(
                                                                      index)
                                                                  .internshipId);
                                                        },
                                                        child:
                                                            Text("Competency")),
                                                  ),
                                                  const PopupMenuDivider(),
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          showDialogSuccess(
                                                              'Downloads',
                                                              'feature coming soon');
                                                          // final invoice =
                                                          //     Invoice(
                                                          //   supplier: NCK(
                                                          //     name: 'NCK Kenya',
                                                          //     address:
                                                          //         'NCK Plaza, Kabarnet Rd off Ngong Rd',
                                                          //     paymentInfo:
                                                          //         'PayBill: 123456',
                                                          //   ),
                                                          //   customer: Student(
                                                          //     name:
                                                          //         '${login.data.value.name}',
                                                          //     phone:
                                                          //         '${login.data.value.mobileNo}',
                                                          //   ),
                                                          //   info: InvoiceInfo(
                                                          //     date: internship(
                                                          //             index)
                                                          //         .applicationDate!,
                                                          //     dueDate:
                                                          //         internship(
                                                          //                 index)
                                                          //             .startDate,
                                                          //     description:
                                                          //         internship(
                                                          //                 index)
                                                          //             .cadreDesc,
                                                          //     number: internship(
                                                          //             index)
                                                          //         .invoiceNo,
                                                          //   ),
                                                          //   items: [
                                                          //     InvoiceItem(
                                                          //         description:
                                                          //             internship(
                                                          //                     index)
                                                          //                 .cadreDesc,
                                                          //         date: internship(
                                                          //                 index)
                                                          //             .startDate,
                                                          //         quantity: 1,
                                                          //         vat: 0.16,
                                                          //         unitPrice: double.parse(
                                                          //             internship(
                                                          //                     index)
                                                          //                 .amountDue)),
                                                          //   ],
                                                          // );

                                                          // final pdfFile =
                                                          //     await PdfInvoiceApi
                                                          //         .generate(
                                                          //             invoice);

                                                          // PdfApi.openFile(
                                                          //     pdfFile);
                                                        },
                                                        child:
                                                            Text("Downloads")),
                                                  ),
                                                  PopupMenuItem(
                                                    child: internship(index)
                                                                .amountDue !=
                                                            "0"
                                                        ?
                                                        //  TextButton(
                                                        //     child: Text("Pay"),
                                                        //     onPressed: () {
                                                        //       Get.defaultDialog(
                                                        //           title:
                                                        //               "Confirm Payment",
                                                        //           confirm: ElevatedButton
                                                        //               .icon(
                                                        //                   onPressed:
                                                        //                       () async {
                                                        //                     await payment.makePayment(internship(index).invoiceNo,
                                                        //                         "internship");

                                                        //                     if (payment.success.value) {
                                                        //                       Get.back();
                                                        //                     }
                                                        //                   },
                                                        //                   icon: Icon(Icons
                                                        //                       .check),
                                                        //                   label: Text(
                                                        //                       "Proceed")),
                                                        //           cancel: ElevatedButton
                                                        //               .icon(
                                                        //                   onPressed:
                                                        //                       () {
                                                        //                     Get.back();
                                                        //                   },
                                                        //                   icon: Icon(Icons
                                                        //                       .cancel),
                                                        //                   label: Text(
                                                        //                       "Cancel")),
                                                        //           middleText:
                                                        //               "Pay for internship?",
                                                        //           radius: 5);
                                                        //     },
                                                        //   )
                                                        TextButton(
                                                            onPressed: () {
                                                              Get.defaultDialog(
                                                                  title:
                                                                      "Confirm Payment",
                                                                  confirm: ElevatedButton
                                                                      .icon(
                                                                          onPressed:
                                                                              () async {
                                                                            await payment.makePayment(internship(index).invoiceNo,
                                                                                "internship");

                                                                            if (payment.success.value) {
                                                                              Get.back();
                                                                            }
                                                                          },
                                                                          icon: Icon(Icons
                                                                              .check),
                                                                          label: Text(
                                                                              "Pay via STK")),
                                                                  cancel: ElevatedButton
                                                                      .icon(
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          icon: Icon(Icons
                                                                              .cancel),
                                                                          label: Text(
                                                                              "Cancel")),
                                                                  middleText: "Pay manually via:" +
                                                                      "\n" +
                                                                      "Paybill Number: xxxxxx" +
                                                                      "\n" +
                                                                      "Account Number: " +
                                                                      internship(
                                                                              index)
                                                                          .invoiceNo! +
                                                                      "\n" +
                                                                      "\n" +
                                                                      "Or Pay via STK Push?",
                                                                  radius: 5);
                                                            },
                                                            child: Text("Pay"))
                                                        : SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(),

                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Application Status",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Text(
                                                        internship(index)
                                                            .applicationStatus
                                                            .toString()
                                                            .substring(18),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: internship(
                                                                            index)
                                                                        .applicationStatus ==
                                                                    InternshipStatus()
                                                                        .underReview
                                                                ? Colors.grey
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        120,
                                                                        90,
                                                                        8))),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Text("Description",
                                                        style: TextStyle(
                                                            color: Palette
                                                                .kToDark)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: internship != null
                                                        ? Text(
                                                            'No description data',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(
                                                            internship(index)
                                                                .cadreDesc
                                                                .toString()
                                                                .substring(10),
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
                                                SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Institution",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        "${internship(index).internshipCenter}",
                                                        maxLines: 3,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color:
                                                                Palette.kToDark,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Application Date",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Text(
                                                        formatter.format(
                                                            DateTime.parse(
                                                                "${internship(index).applicationDate}")),
                                                        style: TextStyle(
                                                            color:
                                                                Palette.kToDark,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                      height: 30,
                                                      child: Text("Start Date",
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .kToDark))),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Text(
                                                        formatter.format(
                                                            DateTime.parse(
                                                                "${internship(index).startDate}")),
                                                        style: TextStyle(
                                                            color:
                                                                Palette.kToDark,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
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

class InternshipStatus {
  final String underReview = "Under Review";
}

class InternshipData {
  call(int index) {
    InternshipGetController controller = Get.put(InternshipGetController());
    return controller.data.value.reversed.toList()[index];
  }
}
