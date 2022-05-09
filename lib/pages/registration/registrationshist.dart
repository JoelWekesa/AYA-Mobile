// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/controllers/nckpayment.dart';
import 'package:aya2/controllers/registration/registrationsget.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegistrationsHistPage extends StatefulWidget {
  const RegistrationsHistPage({Key? key}) : super(key: key);

  @override
  _RegistrationsHistPageState createState() => _RegistrationsHistPageState();
}

class _RegistrationsHistPageState extends State<RegistrationsHistPage> {
  RegistrationsGetController controller = Get.put(RegistrationsGetController());
  NCKPaymentController payment = Get.put(NCKPaymentController());
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var register = RegistrationData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "Registrations"),
      body: RefreshIndicator(
        onRefresh: () async => await controller.getRegistrations(),
        child: Obx(() => controller.isLoading.value
            ? Center(child: ButtonLoaderWhite())
            : controller.registrations.value.registrationApplications == null
                ? centerText("You do not have any registrations")
                : ListView.builder(
                    itemCount: controller.registrations.value.registrationApplications!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      spreadRadius: 8,
                                      blurRadius: 6,
                                      offset: Offset(0, 4), // changes position of shadow
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: const [
                                      Color.fromARGB(255, 179, 198, 249),
                                      Color.fromARGB(255, 237, 243, 236),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  color: Colors.blue.shade50,
                                  border: Border.all(color: Color.fromARGB(255, 156, 164, 179)),
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              // elevation: 5,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //Transfer Reason description
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                              height: 30,
                                              child: Text("Application ID",
                                                  style: TextStyle(color: Palette.kToDark))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text("${register(index).applicationId}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Palette.kToDark,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        //Request Date
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
                                                formatter.format(DateTime.parse(
                                                    "${register(index).applicationDate}")),
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Palette.kToDark,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        //centre from
                                        SizedBox(height: 5),
                                        Padding(
                                            padding: const EdgeInsets.only(left: 8, right: 8),
                                            child: SizedBox(
                                                height: 30,
                                                child: Text("Carde",
                                                    style: TextStyle(color: Palette.kToDark)))),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text("${register(index).cadreDesc}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Palette.kToDark,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        //centre to
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            height: 30,
                                            child: Text(
                                              "Amount Due",
                                              style: TextStyle(color: Palette.kToDark),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text("${register(index).amountDue}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Palette.kToDark,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        //application Status
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            height: 30,
                                            child: Text(
                                              "Application Status",
                                              style: TextStyle(color: Palette.kToDark),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: SizedBox(
                                            width: 200,
                                            height: 30,
                                            child: Text("${register(index).applicationStatus}",
                                                maxLines: 3,
                                                overflow: TextOverflow.clip,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Palette.kToDark,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                          child: FractionallySizedBox(
                                              widthFactor: 1,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: "Confirm Payment",
                                                        confirm: ElevatedButton.icon(
                                                            onPressed: () async {
                                                              print(register(index));
                                                              // await payment.makePayment(
                                                              //     register(index).invoiceNo,
                                                              //     "registration");

                                                              // if (payment.success.value) {
                                                              //   Get.back();
                                                              // }
                                                            },
                                                            icon: Icon(Icons.check),
                                                            label: Text("Proceed")),
                                                        cancel: ElevatedButton.icon(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(Icons.cancel),
                                                            label: Text("Cancel")),
                                                        middleText: "Pay for registration?",
                                                        radius: 5);
                                                  },
                                                  child: Text("Pay"))),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    },
                  )),
      ),
    );
  }
}

class RegistrationData {
  call(int index) {
    RegistrationsGetController controller = Get.find();
    return controller.registrations.value.registrationApplications![index];
  }
}
