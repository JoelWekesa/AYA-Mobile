// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:aya2/controllers/faq/allfaq.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddFAQScreen extends StatelessWidget {
  const AddFAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customContainer(AddFAQ());
  }
}

class AddFAQ extends StatefulWidget {
  const AddFAQ({Key? key}) : super(key: key);

  @override
  _AddFAQState createState() => _AddFAQState();
}

class _AddFAQState extends State<AddFAQ> {
  String? title;
  String? content;
  bool addFaq = false;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  FAQController faqs = Get.put(FAQController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Title Form
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    onChanged: (value) {
                      title = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tittle cannot be empty";
                      }
                    },
                    decoration: InputDecoration(
                        label: Text("Title"),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Palette.kToDark),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
              // Content form
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    maxLines: 5,
                    onChanged: (value) {
                      content = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Content cannot be empty";
                      }
                    },
                    decoration: InputDecoration(
                        label: Text("Content"),
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Palette.kToDark),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.green),
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            loading = true;
            if (_formKey.currentState!.validate()) {
              String url = "/faqs";
              Map <String, String>body = {"title": title!, "content": content!};
              try {
                var response = await BaseCreate().makeApiCall(url, body: body);
                if (response != null) {
                  faqs.getAllFaQs();
                  loading = false;
                }
              } finally {
                loading = false;
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Palette.kToDark, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              loading // If the login process is ongoing
                  ? Text("Loading....")
                  : SizedBox(),
              Icon(FontAwesomeIcons.plus, color: Colors.white),
              SizedBox(width: 10),
              Text("Add FAQ", style: TextStyle(letterSpacing: 2, fontSize: 20, color: Colors.white))
            ]),
          ),
        ),
      ],
    );
  }
}
