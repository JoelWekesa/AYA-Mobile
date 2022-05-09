// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/updateprofile.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/updateprofile.dart';
import '../screens/dialog.dart';

// final AuthenticatedUserController controller =
//     Get.find<AuthenticatedUserController>();
final LoginController login = Get.find<LoginController>();
// final controller = Get.find<AuthController>();
final controller = Get.put(AuthenticatedUserController());

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? address;
  String? email;
  String? mobileNo;
  String? all;
  PlatformFile? profilePic;
  final _formKey = GlobalKey<FormState>();
  bool? isLoading = false;
  UpdateProfileController update = Get.put(UpdateProfileController());

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) {
  //       setState(() {
  //         all = "No";
  //       });
  //       return;
  //     }

  //     final tempImage = File(image.path);
  //     setState(() {
  //       profilePic = tempImage;
  //     });
  //   } on Exception catch (e) {
  //     showDialogFail("Error", "Please select profile picture");
  //     print(e);
  //   }
  // }
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
        profilePic = result.files.first;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  child: Stack(
                    children: [
                      Obx(() => controller.isLoading.value
                          ? CircleAvatar(radius: 70, backgroundColor: Colors.grey, child: Text("A"))
                          : CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage: NetworkImage("${controller.data.value.profilePic}"),
                            )),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => pickImage(),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blueGrey,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.blueGrey,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  FontAwesomeIcons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.blueAccent,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefixIcon: const Icon(FontAwesomeIcons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  mobileNo = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone number";
                  }
                },
              ),
              Container(
                height: 8,
              ),
              TextFormField(
                cursorColor: Colors.blueAccent,
                decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: const Icon(FontAwesomeIcons.mailBulk),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter email address";
                  }
                },
              ),
              Container(
                height: 8,
              ),
              TextFormField(
                cursorColor: Colors.blueAccent,
                decoration: InputDecoration(
                    hintText: "Address",
                    prefixIcon: const Icon(FontAwesomeIcons.addressBook),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                onChanged: (value) {
                  address = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter address";
                  }
                },
              ),
              Container(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // print(all);
                      if (profilePic != null) {
                        setState(() {
                          isLoading = true;
                        });
                        // print(body);
                        Map<String, String> body = {
                          'index_id': controller.data.value.id!,
                          'mobileno': mobileNo!,
                          'email': email!,
                          'address': address!,
                        };
                        // print(body);
                        await BaseCreate().makeAPICallWithImage(
                          "/auth/update",
                          body,
                          "profile_pic",
                          profilePic!,
                          token: login.data.value.token,
                        );
                        AuthenticatedUserController().authenticatedUser();
                        setState(() {
                          isLoading = false;
                        });
                        Get.toNamed('/');
                      } else {
                        showDialogFail("Error", "Please select image");
                      }
                    }
                  },
                  child: Text(isLoading == true ? "Loading..." : "Update"),
                ),
              )
              // InkWell(
              //   onTap: () async {
              //     if (_formKey.currentState!.validate()) {
              //       print(all);
              //       if (all != "No") {
              //         await update.updatedProfile(
              //             _phoneNumber, _email, _address, profilePic);
              //       } else {
              //         showDialogFail("Error", "Please fill all fields");
              //       }
              //     }
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: 50,
              //     width: double.infinity,
              //     margin: EdgeInsets.all(10),
              //     decoration: const BoxDecoration(
              //         color: Color.fromARGB(255, 7, 36, 59),
              //         borderRadius: BorderRadius.all(Radius.circular(10))),
              //     child: Obx(() => Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               update.isLoading
              //                       .value // If the login process is ongoing
              //                   ? const ButtonLoader()
              //                   : const SizedBox(),
              //               const Icon(FontAwesomeIcons.pencilAlt,
              //                   color: Colors.white),
              //               const SizedBox(width: 10),
              //               const Text("Update",
              //                   style: TextStyle(
              //                       letterSpacing: 2,
              //                       fontSize: 20,
              //                       color: Colors.white))
              //             ])),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
