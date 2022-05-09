// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/exam/examcard.dart';
import 'package:aya2/controllers/exam/examhistory.dart';
import 'package:aya2/controllers/generators/examcard.dart';
import 'package:aya2/controllers/pdf.dart';
import 'package:aya2/controllers/pdfinvoice.dart';
import 'package:aya2/models/exams/examshistory.dart';
import 'package:aya2/models/invoice/invoice.dart';
import 'package:aya2/models/invoice/nck.dart';
import 'package:aya2/models/invoice/student.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ExamHistoryComponent extends StatelessWidget {
  const ExamHistoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExamHistoryController controller = Get.put(ExamHistoryController());
    return SafeArea(
      child: Obx(() => controller.isLoading.value
          ? Center(
              child: Text("Getting data...",
                  style: Theme.of(context).textTheme.bodyText1))
          : ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return customContainer(examHistoryData(context,
                    data: controller.data[index], index: index));
              },
            )),
    );
  }
}

Widget examHistoryData(BuildContext context,
    {required ExamsHistoryModel data, required int index}) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  AuthenticatedUserController authUser = Get.put(AuthenticatedUserController());
  ExamCardController controller = Get.put(ExamCardController());
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
      Widget>[
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      examDetails(
        context,
        title: "Exam Series",
        value: "${data.examsSeries}"
            .replaceAll("ExamsSeries.", "")
            .replaceAll("_", " "),
      ),
      PopupMenuButton(
        color: Colors.grey[500],
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
            child: TextButton(
                onPressed: () async {
                  final invoice = Invoice(
                    supplier: NCK(
                      name: 'NCK Kenya',
                      address: 'NCK Plaza, Kabarnet Rd off Ngong Rd',
                      paymentInfo: 'PayBill: 123456',
                    ),
                    customer: Student(
                      name: '${authUser.data.value.name}',
                      phone: '${authUser.data.value.mobileNo}',
                    ),
                    info: InvoiceInfo(
                      date: data.applicationDate!,
                      dueDate: data.applicationDate!,
                      description: "Exam Payment",
                      number: data.invoiceNo!,
                    ),
                    items: [
                      InvoiceItem(
                          description: data.examCenters!,
                          date: data.applicationDate!,
                          quantity: 1,
                          vat: 0.16,
                          unitPrice: double.parse(data.amountDue!)),
                    ],
                  );

                  final pdfFile = await PdfInvoiceApi.generate(invoice);

                  PdfApi.openFile(pdfFile);
                },
                child: Text("Invoice")),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: TextButton(
                onPressed: () async {
                  Get.back();
                  Get.toNamed("/payments", arguments: data);
                },
                child: Text("Pay For Exam")),
          ),
          PopupMenuItem(
            child: TextButton(
                onPressed: () async {
                  Get.back();
                  if (index == 0) {
                    final pdfFile =
                        await PdfExamCardApi.generate(controller.data[0]);
                    PdfApi.openFile(pdfFile);
                  } else {
                    showDialogInfo("Unavailable", "No exam card available");
                  }
                  // Get.Named("/examcard", arguments: data.invoiceNo);
                },
                child: Text("Exam Card")),
          ),
        ],
      ),
    ]),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child: Text("Cadre", style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: Text(
            "${data.cadre}".replaceAll("Cadre.", "").replaceAll("_", " "),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(context,
    //     title: "Cadre", value: '${data.cadre}'.replaceAll("Cadre.", "").replaceAll("_", " ")),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child: Text("Application Date",
                style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text(formatter.format(DateTime.parse("${data.applicationDate}")),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Application Date",
    //   value: formatter.format(data.applicationDate!),
    // ),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child: Text("Exam Centres",
                style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text("${data.examCenters}".replaceAll("examCenters.", ""),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Exam Centers",
    //   value: data.examCenters!,
    // ),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child:
                Text("Invoice No", style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text("${data.invoiceNo}".replaceAll("invoiceNo.", ""),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Invoice Number",
    //   value: data.invoiceNo!,
    // ),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child:
                Text("Amount Due", style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text("KSH: ${data.amountDue}".replaceAll("amountDue.", ""),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Amount Due",
    //   value: data.amountDue!,
    // ),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child:
                Text("Amount Paid", style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text("KSH: ${data.amountPaid}".replaceAll("amountPaid.", ""),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Amount Paid",
    //   value: data.amountPaid!,
    // ),
    SizedBox(height: 5),
    Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
            height: 30,
            child:
                Text("Balance Due", style: TextStyle(color: Palette.kToDark)))),
    Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Text("KSH: ${data.balanceDue}".replaceAll("balanceDue.", ""),
            maxLines: 3,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    ),
    // SizedBox(height: 2),
    // Divider(color: Colors.grey),
    // examDetails(
    //   context,
    //   title: "Balance Due",
    //   value: data.balanceDue!,
    // )
  ]);
}

Column examDetails(BuildContext context,
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
