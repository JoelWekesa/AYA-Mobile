// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final controller = Get.put(LoginController());
final authenticatedUser = Get.put(AuthenticatedUserController());

final Function navigator = (String route) => {
      if (Get.currentRoute == route)
        {Get.back()}
      else
        {Get.back(), Get.toNamed(route)}
    };

Drawer mainDrawer() {
  return Drawer(
    child: Material(
      color: Color.fromARGB(255, 2, 25, 44),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 1, 16, 26),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  "${controller.data.value.profilePic}"),
                            )
                          ],
                        ),
                      ),
                      Container(height: 10),
                      Text("${controller.data.value.name}"),
                      Container(height: 3),
                      Container(
                        height: 12,
                      ),
                      Divider(height: 1, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 5),
                  InkWell(
                    onTap: () => navigator("/"),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.home,
                              size: 20.0, color: Colors.white),
                          Container(width: 10),
                          Text("Home"),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 15),
                  InkWell(
                    onTap: () => navigator("/profile"),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.userNurse,
                              size: 20.0, color: Colors.white),
                          Container(width: 10),
                          Text("My Account"),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Student",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    collapsedTextColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    children: <Widget>[
                      Container(height: 15),
                      // Divider(height: 1, color: Colors.grey),
                      // Divider(),
                      InkWell(
                        onTap: () => navigator("/internships"),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.idCard,
                                  size: 20.0, color: Colors.white),
                              Container(width: 10),
                              Text(
                                "Internships",
                              ),
                              Spacer(),
                              Icon(Icons.navigate_next,
                                  size: 25.0, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),
                      //exams
                      Container(height: 15),
                      InkWell(
                        onTap: () => navigator("/exam"),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.file_copy_outlined,
                                  size: 20.0, color: Colors.white),
                              Container(width: 10),
                              Text(
                                "Exam",
                              ),
                              Spacer(),
                              Icon(Icons.navigate_next,
                                  size: 25.0, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),

                      Container(height: 15),
                      InkWell(
                        onTap: () => navigator("/registration_screen"),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.people_alt,
                                  size: 20.0, color: Colors.white),
                              Container(width: 10),
                              Text(
                                "Register",
                              ),
                              Spacer(),
                              Icon(Icons.navigate_next,
                                  size: 25.0, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),

                      // //practitioner
                      // Container(height: 15),
                      // // controller.user.value.registration!.isNotEmpty
                      // InkWell(
                      //   onTap: () => navigator("/sample"),
                      //   child: Container(
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      //     child: Row(
                      //       children: <Widget>[
                      //         Icon(Icons.people,
                      //             size: 20.0, color: Colors.white),
                      //         Container(width: 10),
                      //         Text(
                      //           "SampleApply",
                      //         ),
                      //         Spacer(),
                      //         Icon(Icons.navigate_next,
                      //             size: 25.0, color: Colors.grey[400]),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(),
                      // : SizedBox(),
                    ],
                  ),
                  ExpansionTile(
                    title:
                        Text("Practitioner", style: TextStyle(fontSize: 15.0)),
                    collapsedTextColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    children: <Widget>[
                      //Licenses
                      Container(height: 15),
                      // int.parse('${authenticatedUser.data.value.cpd!.single.currentPoints}') <
                      //         int.parse(
                      //             '${authenticatedUser.data.value.cpd!.single.cpdRequirement}')
                      InkWell(
                        onTap: () => navigator("/licence_screen"),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.certificate,
                                  size: 20.0, color: Colors.white),
                              Container(width: 10),
                              Text(
                                "Licences",
                              ),
                              Spacer(),
                              Icon(Icons.navigate_next,
                                  size: 25.0, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(),

                      //CPD
                      Container(height: 15),
                      InkWell(
                        onTap: () => navigator("/CPD"),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.book,
                                  size: 20.0, color: Colors.white),
                              Container(width: 10),
                              Text(
                                "CPDs",
                              ),
                              Spacer(),
                              Icon(Icons.navigate_next,
                                  size: 25.0, color: Colors.grey[400]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),

                  //Dropdown

                  Container(height: 15),
                  Divider(height: 1, color: Colors.grey),
                  Divider(),
                  //Knowledge base
                  Container(height: 15),
                  InkWell(
                    onTap: () => navigator("/articles"),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.brain,
                              size: 20.0, color: Colors.white),
                          Container(width: 10),
                          Text(
                            "Knowledge Base",
                          ),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),

                  //FAQ
                  Container(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => navigator("/faq"),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.question_answer,
                              size: 20.0, color: Colors.white),
                          Container(width: 10),
                          Text(
                            "FAQ",
                          ),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),

                  Container(height: 20),
                  Divider(height: 1, color: Colors.grey),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                        onConfirm: () {
                          // controller.userLogout();
                        },
                        title: "Log Out from AYA",
                        middleText: "Are you Sure ?",
                        backgroundColor: Colors.blueAccent,
                        titleStyle: TextStyle(color: Colors.white),
                        middleTextStyle: TextStyle(color: Colors.white),
                        cancelTextColor: Colors.white,
                        confirmTextColor: Colors.white,
                        confirm: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent),
                            onPressed: () {
                              controller.userLogout();
                            },
                            icon: Icon(FontAwesomeIcons.signOutAlt),
                            label: Text("Confirm")),
                        cancel: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen),
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(FontAwesomeIcons.arrowLeft),
                            label: Text("Cancel")),
                        barrierDismissible: false,
                        // radius: 50,
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.signOutAlt,
                              size: 20.0, color: Colors.white),
                          Container(width: 10),
                          Text(
                            "Log Out",
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          Divider(),
                          ListTile(
                              leading: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/nck.jpeg"),
                                  ),
                                ),
                              ),
                              title: Text(
                                'Nursing Council of Kenya',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
