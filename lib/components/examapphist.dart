// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/exam/examapphist.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nckpayment.dart';

class ExamAppHistoryComp extends StatefulWidget {
  const ExamAppHistoryComp({Key? key}) : super(key: key);

  @override
  _ExamAppHistoryCompState createState() => _ExamAppHistoryCompState();
}

class _ExamAppHistoryCompState extends State<ExamAppHistoryComp> {
  ExamAppHistController controller = Get.put(ExamAppHistController());
  var applications = ExamsHistData();
  NCKPaymentController payment = Get.find();
  String searchString = "";
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getExamApps(),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0)),
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
                              //fillColor: Colors.grey,
                              //filled: true,
                              border: InputBorder.none,
                              labelText:
                                  "Search invoice number here, case sensitive",
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
                            //search by invoice number
                            return controller.data[index].invoiceNo!
                                    .contains(searchString)
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text(
                                                        "Application ID",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    "${applications(index).applicationId}",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Exam Series",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    applications(index)
                                                        .examsSeries
                                                        .toString()
                                                        .substring(12),
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Text(
                                            //       "Employer: ${licences(index).employer}"
                                            //           .replaceAll("Employer.", ""),
                                            //       style: TextStyle(
                                            //           letterSpacing: 2, fontSize: 18)),
                                            // ),
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Cadre",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    applications(index)
                                                        .cadre
                                                        .toString()
                                                        .substring(6)
                                                        .replaceAll(
                                                            "WorkstationName.",
                                                            ""),
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),

                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Invoice No",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    "${applications(index).invoiceNo}",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Text(
                                            //       "Invoice No: ${licences(index).invoiceNo}",
                                            //       style: TextStyle(
                                            //           letterSpacing: 2, fontSize: 18)),
                                            // ),
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Amount Due",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    "${applications(index).amountDue}",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Text(
                                            //       "Amount Due: KSH ${licences(index).amountDue}",
                                            //       style: TextStyle(
                                            //           letterSpacing: 2, fontSize: 18)),
                                            // ),
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Amount Paid",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    "KSH: ${applications(index).amountPaid}",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Text(
                                            //       "Amount Paid: KSH ${licences(index).amountPaid}",
                                            //       style: TextStyle(
                                            //           letterSpacing: 2, fontSize: 18)),
                                            // ),
                                            SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Text("Balance Due",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SizedBox(
                                                width: 200,
                                                height: 30,
                                                child: Text(
                                                    "KSH: ${applications(index).balanceDue}",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: FractionallySizedBox(
                                                widthFactor: 1,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                          title:
                                                              "Confirm Payment",
                                                          confirm: ElevatedButton
                                                              .icon(
                                                                  onPressed:
                                                                      () async {
                                                                    await payment.makePayment(
                                                                        applications(index)
                                                                            .invoiceNo,
                                                                        "licence");

                                                                    if (payment
                                                                        .success
                                                                        .value) {
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
                                                              applications(
                                                                      index)
                                                                  .invoiceNo! +
                                                              "\n" +
                                                              "\n" +
                                                              "Or Pay via STK Push?",
                                                          radius: 5);
                                                    },
                                                    child: Text("Pay")),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueAccent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  )
                                : Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}

class ExamsHistData {
  call(int index) {
    ExamAppHistController controller = Get.find();
    return controller.data.value[index];
    //return controller.data.value.message!.examApplications![index];
  }
}
