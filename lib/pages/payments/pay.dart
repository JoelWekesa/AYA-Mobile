// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, prefer_const_literals_to_create_immutables

import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../palette.dart';
import 'instructions.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? phoneNumber;

    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Payments'), centerTitle: true),
      body: customContainer(
        ListView(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.phone),
                        helperText: ("Phone Number"))),
              ),
            ),
            InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, String> body = {
                      "invoice_no": data.invoiceNo,
                      "phone_no": phoneNumber!,
                      "transaction": "Exam Payment"
                    };

                    await BaseCreate().sendSTK(body: body);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Palette.kToDark, borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(width: 5),
                    Text("Send To Phone",
                        style: TextStyle(letterSpacing: 2, fontSize: 20, color: Colors.grey[100]))
                  ]),
                )),
            SizedBox(height: 10),
            Divider(color: Palette.kToDark),
            payInstructions(context, data),
          ],
        ),
      ),
    );
  }
}
