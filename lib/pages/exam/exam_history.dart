// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/exam/examapphist.dart';
import 'package:aya2/controllers/exam/examget.dart';
import 'package:aya2/controllers/nckpayment.dart';
import 'package:aya2/controllers/pdf.dart';
import 'package:aya2/controllers/pdfinvoice.dart';
import 'package:aya2/models/authenticated.dart';
import 'package:aya2/models/examapphist.dart';
import 'package:aya2/models/examget.dart';
import 'package:aya2/models/invoice/invoice.dart';
import 'package:aya2/models/invoice/nck.dart';
import 'package:aya2/models/invoice/student.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:intl/intl.dart';
import '../../controllers/auth/authenticated.dart';

class ExamHistoryPage extends StatefulWidget {
  const ExamHistoryPage({Key? key}) : super(key: key);

  @override
  State<ExamHistoryPage> createState() => _ExamHistoryPageState();
}

class _ExamHistoryPageState extends State<ExamHistoryPage> {
  ExamGetController controller = Get.put(ExamGetController());
  AuthenticatedUserController authenticatedUser =
      Get.put(AuthenticatedUserController());

  LoginController login = Get.find();

  NCKPaymentController payment = Get.put(NCKPaymentController());
  String searchString = "";

  final TextEditingController searchController = TextEditingController();

  // NCKPaymentController payment = Get.find();
  var exams = ExamData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getExams(login.data.value.id!),
        child: Obx(() => controller.isLoading.value
            ? const Center(child: ButtonLoaderWhite())
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
                                  "Search invoice number here, case sensitive",
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
                          itemCount: controller.exams.value == null
                              ? 0
                              : controller.exams.value.length,
                          //itemCount: //controller.exams.value.invoiceNo!.length,//competencies.competencies.length,//rareas.data.value.rotationAreas!.length,
                          //controller.exams.value.message?.examApplications?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return customContainer(examHistory(
                                controller.exams[index], context, exams));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0.0,
        onPressed: () {
          Get.toNamed(
            "/examapplication",
          );
        },
        label: const Text('Apply Exam'),
        icon: const Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}

Widget examHistory(ExamGet item, BuildContext context, ExamData exams) {
  LoginController login = Get.find();
  NCKPaymentController payment = Get.find();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Exam series
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed("/examcard", arguments: item.invoiceNo);
                          },
                          child: Text("Exam Card")),
                    ),
                    const PopupMenuDivider(),
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
                                name: '${login.data.value.name}',
                                phone: '${login.data.value.mobileNo}',
                              ),
                              info: InvoiceInfo(
                                date: item.applicationDate!,
                                dueDate: item.applicationDate!,
                                description: item.balanceDue!,
                                number: item.invoiceNo!,
                              ),
                              items: [
                                InvoiceItem(
                                    description: item.examCenters!,
                                    date: item.applicationDate!,
                                    quantity: 1,
                                    vat: 0.16,
                                    unitPrice: double.parse(item.amountDue!)),
                              ],
                            );

                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);

                            PdfApi.openFile(pdfFile);
                          },
                          child: Text("Invoice")),
                    ),
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
                                name: '${login.data.value.name}',
                                phone: '${login.data.value.mobileNo}',
                              ),
                              info: InvoiceInfo(
                                date: item.applicationDate!,
                                dueDate: item.applicationDate!,
                                description: item.balanceDue!,
                                number: item.invoiceNo!,
                              ),
                              items: [
                                InvoiceItem(
                                    description: item.examCenters!,
                                    date: item.applicationDate!,
                                    quantity: 1,
                                    vat: 0.16,
                                    unitPrice: double.parse(item.amountDue!)),
                              ],
                            );

                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);

                            PdfApi.openFile(pdfFile);
                          },
                          child: Text("Receipt")),
                    ),
                    PopupMenuItem(
                      child: item.amountDue != "0"
                          ? TextButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Confirm Payment",
                                    confirm: ElevatedButton.icon(
                                        onPressed: () async {
                                          await payment.makePayment(
                                              item.invoiceNo!, "internship");

                                          if (payment.success.value) {
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
                                    middleText: "Pay manually via:" +
                                        "\n" +
                                        "Paybill Number: xxxxxx" +
                                        "\n" +
                                        "Account Number: " +
                                        item.invoiceNo! +
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
            ],
          ),

          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child: Text("Exam Series",
                      style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text(
                  "${item.examsSeries}"
                      .replaceAll("examsSeries.", "")
                      .replaceAll("null", "April 2022"),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Cadre
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child:
                      Text("Cadre", style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text("${item.cadre}".replaceAll("Cadre.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Application Date
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
              child: Text(
                  formatter.format(DateTime.parse("${item.applicationDate}")),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Exam Centres
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
              child: Text("${item.examCenters}".replaceAll("examCenters.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Invoice No
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child: Text("Invoice No",
                      style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text("${item.invoiceNo}".replaceAll("invoiceNo.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Amount Due
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child: Text("Amount Due",
                      style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text("KSH: ${item.amountDue}".replaceAll("amountDue.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          // Amount Paid
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child: Text("Amount Paid",
                      style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text(
                  "KSH: ${item.amountPaid}".replaceAll("amountPaid.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
          //Balance Due
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 30,
                  child: Text("Balance Due",
                      style: TextStyle(color: Palette.kToDark)))),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 200,
              height: 30,
              child: Text(
                  "KSH: ${item.balanceDue}".replaceAll("balanceDue.", ""),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   elevation: 0.0,
      //   onPressed: () {
      //     Get.toNamed(
      //       "/examapplication",
      //     );
      //   },
      //   label: const Text('Apply Exam'),
      //   icon: const Icon(FontAwesomeIcons.plus),
      // ),
    ),
  );
}

class ExamData {
  call(int index) {
    ExamGetController controller = Get.find();
    return controller.exams.value[index];
    //return controller.exams.value.message!.examApplications![index];
  }
}
