import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/registereduction.dart';
import 'package:aya2/controllers/registration/register.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/screens/buttonloader.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:aya2/utils/center_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/auth/authenticated.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  AuthenticatedUserController authuser = Get.put(AuthenticatedUserController());
  LoginController login = Get.put(LoginController());

  String? education_id;
  PlatformFile? current_passport;
  final _formKey = GlobalKey<FormState>();
  RegisterEducationController education =
      Get.put(RegisterEducationController());

  RegisterController controller = Get.put(RegisterController());
  bool? isLoading = false;

  Future pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpeg',
        'png',
        'jpg',
      ],
    );

    if (result != null) {
      setState(() {
        current_passport = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(),
        // appBar: AppBar(
        //   title: const Center(child: Text("Registration")),
        // ),
        body: Obx(() => education.isLoading.value
            ? const Center(
                child: ButtonLoaderWhite(),
              )
            : login.data.value.education!.length != 1
                // : education.success.value && education.education.isEmpty
                ? centerText(
                    "You are currently not elligible to register",
                  )
                : ListView(
                    children: [
                      //? Page Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                onChanged: (value) => education_id = value,
                                validator: (value) => value == null
                                    ? 'Please select education'
                                    : null,
                                decoration: InputDecoration(
                                  labelText: "Select Educations",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.greenAccent, width: 5.0),
                                  ),
                                ),
                                items: education.education
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.educationId,
                                    child: Text("${value.cadreText}",
                                        overflow: TextOverflow.fade),
                                  );
                                }).toList(),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => pickImage(),
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Center(
                                      child: ListTile(
                                          // ignore: prefer_const_constructors
                                          leading: Icon(
                                              FontAwesomeIcons.fileImage,
                                              size: 50),
                                          // : ClipRRect(
                                          //     borderRadius:
                                          //         BorderRadius.circular(
                                          //             8.0),
                                          //     child: Image.file(
                                          //         current_passport!)),
                                          title: current_passport == null
                                              ? Text("Select Degree")
                                              : Text(current_passport!.name)),
                                    )),
                              ),
                            ),
                            // Password form
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (current_passport != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                // print(education_id);
                                Map<String, String> body = {
                                  'index_id': login.data.value.id!,
                                  'education_id': education_id!,
                                };
                                await BaseCreate().makeAPICallWithImage(
                                    "/auth/registration/apply",
                                    body,
                                    "current_passport",
                                    current_passport!);
                                setState(() {
                                  isLoading = false;
                                  Get.offAndToNamed('/');
                                });
                              } else {
                                showDialogFail("Error", "Please select image");
                              }
                            }
                          },
                          child: Text(
                              isLoading == true ? "Loading..." : "Register"),
                        ),
                      )

                      //? Login Button
                      // InkWell(
                      //   onTap: () async {
                      //     if (_formKey.currentState!.validate()) {
                      //       await controller.registerUser(
                      //           education_id!, current_passport!);
                      //     }
                      //   },
                      //   child: Container(
                      //       alignment: Alignment.center,
                      //       height: 50,
                      //       width: double.infinity,
                      //       margin: EdgeInsets.all(10),
                      //       decoration: const BoxDecoration(
                      //           color: Color.fromARGB(255, 6, 43, 73),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10))),
                      //       child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             controller.isLoading.value
                      //                 ? ButtonLoader()
                      //                 : SizedBox(),
                      //             const Icon(FontAwesomeIcons.paperPlane,
                      //                 color: Colors.white),
                      //             SizedBox(width: 10),
                      //             const Text("Register",
                      //                 style: TextStyle(
                      //                     letterSpacing: 2,
                      //                     fontSize: 20,
                      //                     color: Colors.white))
                      //           ])),
                      // ),

                      //? Link to login
                    ],
                  )));
  }
}
