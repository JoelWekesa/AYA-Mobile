// ignore_for_file: prefer_const_constructors

// import 'package:aya_mobile/controllers/nckpayment.dart';
// import 'package:aya_mobile/screens/appbar.dart';
import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/licence/lapplications.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/nckpayment.dart';
import 'package:aya2/controllers/pdf.dart';
import 'package:aya2/controllers/pdfinvoice.dart';
import 'package:aya2/models/invoice/invoice.dart';
import 'package:aya2/models/invoice/nck.dart';
import 'package:aya2/models/invoice/student.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import '../models/invoice/invoice.dart';
// import '../models/invoice/nck.dart';
// import '../models/invoice/student.dart';
// import '../services/pdf.dart';
// import '../services/pdfinvoice.dart';

class LicenceHistory extends StatefulWidget {
  const LicenceHistory({Key? key}) : super(key: key);

  @override
  _LicenceHistoryState createState() => _LicenceHistoryState();
}

class _LicenceHistoryState extends State<LicenceHistory> {
  LicenceApplicationsController controller =
      Get.put(LicenceApplicationsController());
  // LoginController login = Get.find();
  AuthenticatedUserController login = Get.put(AuthenticatedUserController());
  NCKPaymentController payment = Get.put(NCKPaymentController());
  var licences = LicenceData();
  String searchString = "";
  final TextEditingController searchController = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "Licence Applications"),
      body: RefreshIndicator(
        onRefresh: () => controller.getLicences(login.data.value.id),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.applications.value.isEmpty
                ? centerText("You do not have any recorded licences.")
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
                                      "Search Invoice Number here, case sensitive",
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  border: InputBorder.none,
                                  // labelText:
                                  //     "Search Invoice Number here, case sensitive",
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
                              itemCount: controller.applications.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return controller.applications[index].invoiceNo!
                                        .toString()
                                        .contains(searchString)
                                    ? Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Center(
                                                      child: PopupMenuButton(
                                                        icon: Icon(
                                                            Icons.more_vert),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context) =>
                                                                <PopupMenuEntry>[
                                                          PopupMenuItem(
                                                            child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  final invoice =
                                                                      Invoice(
                                                                    supplier:
                                                                        NCK(
                                                                      name:
                                                                          'NCK Kenya',
                                                                      address:
                                                                          'NCK Plaza, Kabarnet Rd off Ngong Rd',
                                                                      paymentInfo:
                                                                          'PayBill: 123456',
                                                                    ),
                                                                    customer:
                                                                        Student(
                                                                      name:
                                                                          '${login.data.value.name}',
                                                                      phone:
                                                                          '${login.data.value.mobileNo}',
                                                                    ),
                                                                    info:
                                                                        InvoiceInfo(
                                                                      date: licences(
                                                                              index)
                                                                          .renewalDate!,
                                                                      dueDate: licences(
                                                                              index)
                                                                          .renewalDate!,
                                                                      description:
                                                                          'Licence Payment',
                                                                      number: licences(
                                                                              index)
                                                                          .invoiceNo!,
                                                                    ),
                                                                    items: [
                                                                      InvoiceItem(
                                                                          description:
                                                                              "Licence Payment",
                                                                          date: licences(index)
                                                                              .renewalDate!,
                                                                          quantity:
                                                                              1,
                                                                          vat:
                                                                              0.16,
                                                                          unitPrice:
                                                                              double.parse(licences(index).amountDue!)),
                                                                    ],
                                                                  );

                                                                  final pdfFile =
                                                                      await PdfInvoiceApi
                                                                          .generate(
                                                                              invoice);

                                                                  PdfApi.openFile(
                                                                      pdfFile);
                                                                },
                                                                child: Text(
                                                                    "Invoice")),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Application ID",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .applicationId !=
                                                                null
                                                            ? "${licences(index).applicationId}"
                                                            : "Not Available",
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

                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text("Employer",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .employer !=
                                                                null
                                                            ? "${licences(index).employer}"
                                                                .replaceAll(
                                                                    "Employer.",
                                                                    "")
                                                            : "Not Available",
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Work Station",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .workstationName !=
                                                                null
                                                            ? "${licences(index).workstationName}"
                                                                .replaceAll(
                                                                    "WorkstationName.",
                                                                    "")
                                                            : "Not Available",
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
                                                // Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: Text(
                                                //       "Work Station: ${licences(index).workstationName}"
                                                //           .replaceAll("WorkstationName.", ""),
                                                //       style: TextStyle(
                                                //           letterSpacing: 2, fontSize: 18)),
                                                // ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text("County",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .county !=
                                                                null
                                                            ? "${licences(index).county}"
                                                                .replaceAll(
                                                                    "County.",
                                                                    "")
                                                            : "Not Available",
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .clip,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color:
                                                                Palette.kToDark,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: Text(
                                                //       "County: ${licences(index).county}"
                                                //           .replaceAll("County.", ""),
                                                //       style: TextStyle(
                                                //           letterSpacing: 2, fontSize: 18)),
                                                // ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Invoice No",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .invoiceNo !=
                                                                null
                                                            ? "${licences(index).invoiceNo}"
                                                            : "Not Available",
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
                                                // Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: Text(
                                                //       "Invoice No: ${licences(index).invoiceNo}",
                                                //       style: TextStyle(
                                                //           letterSpacing: 2, fontSize: 18)),
                                                // ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Amount Due",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .amountDue !=
                                                                null
                                                            ? "${licences(index).amountDue}"
                                                            : "Not Available",
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
                                                // Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: Text(
                                                //       "Amount Due: KSH ${licences(index).amountDue}",
                                                //       style: TextStyle(
                                                //           letterSpacing: 2, fontSize: 18)),
                                                // ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Amount Paid",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .amountPaid !=
                                                                null
                                                            ? "KSH: ${licences(index).amountPaid}"
                                                            : "Not Available",
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
                                                // Padding(
                                                //   padding: const EdgeInsets.all(8.0),
                                                //   child: Text(
                                                //       "Amount Paid: KSH ${licences(index).amountPaid}",
                                                //       style: TextStyle(
                                                //           letterSpacing: 2, fontSize: 18)),
                                                // ),
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Balance Due",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .balanceDue !=
                                                                null
                                                            ? "KSH: ${licences(index).balanceDue}"
                                                            : "Not Available",
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
                                                //renewal date
                                                SizedBox(height: 5),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: SizedBox(
                                                        height: 30,
                                                        child: Text(
                                                            "Renewal Date",
                                                            style: TextStyle(
                                                                color: Palette
                                                                    .kToDark)))),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SizedBox(
                                                    width: 200,
                                                    height: 30,
                                                    child: Text(
                                                        licences(index)
                                                                    .renewalDate !=
                                                                null
                                                            ? formatter.format(
                                                                DateTime.parse(
                                                                    "${licences(index).renewalDate}"))
                                                            : 'Not Available',
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

                                                licences(index).amountDue != "0"
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            FractionallySizedBox(
                                                          widthFactor: 1,
                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                Get.defaultDialog(
                                                                    title: "Confirm Payment",
                                                                    confirm: ElevatedButton.icon(
                                                                        onPressed: () async {
                                                                          await payment.makePayment(
                                                                              licences(index).invoiceNo,
                                                                              "licence");

                                                                          if (payment
                                                                              .success
                                                                              .value) {
                                                                            Get.back();
                                                                          }
                                                                        },
                                                                        icon: Icon(Icons.check),
                                                                        label: Text("Pay via STK")),
                                                                    cancel: ElevatedButton.icon(
                                                                        onPressed: () {
                                                                          Get.back();
                                                                        },
                                                                        icon: Icon(Icons.cancel),
                                                                        label: Text("Cancel")),
                                                                    middleText: "Pay manually via:" + "\n" + "Paybill Number: xxxxxx" + "\n" + "Account Number: " + controller.applications[index].invoiceNo! + "\n" + "\n" + "Or Pay via STK Push?",
                                                                    radius: 5);
                                                              },
                                                              child:
                                                                  Text("Pay")),
                                                        ),
                                                      )
                                                    // ? Padding(
                                                    //     padding:
                                                    //         const EdgeInsets
                                                    //             .all(8.0),
                                                    //     child:
                                                    //         FractionallySizedBox(
                                                    //       widthFactor: 1,
                                                    //       child: ElevatedButton(
                                                    //           onPressed:
                                                    //               () async {
                                                    //             Get.back();
                                                    //             Get.toNamed(
                                                    //                 "/payments",
                                                    //                 arguments:
                                                    //                     licences);
                                                    //           },
                                                    //           child:
                                                    //               Text("Pay")),
                                                    //     ),
                                                    //   )
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ),
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
                                                // ignore: prefer_const_literals_to_create_immutables
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

class LicenceData {
  call(int index) {
    LicenceApplicationsController controller = Get.find();
    controller.applications.value
        .sort((a, b) => b.renewalDate!.compareTo(a.renewalDate!));
    return controller.applications.value[index];
  }
}
