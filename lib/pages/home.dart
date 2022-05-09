// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/network.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:aya2/screens/pagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/auth/authenticated.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticatedUserController authUser = Get.put(AuthenticatedUserController());
  NetworkController network = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(),
        appBar: CustomAppBar(title: "AYA"),
        // appBar: AppBar(
        //     title: Center(
        //   child: Text(
        //     "AYA",
        //   ),
        // )),
        body: Obx(() => authUser.isLoading.value
            ? Center(
                child: Text("Loading...",
                    style: Theme.of(context).textTheme.bodyText1),
              )
            : pageContainer(
                Stack(
                  children: [
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 42, 16),
                          child: InkWell(
                            onTap: () => Get.toNamed("/profile"),
                            child: Column(children: const [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage("assets/nurse.png"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("MyProfile",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 2)),
                              )
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Text('Students Modules',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        SingleChildScrollView(
                            // padding: const EdgeInsets.fromLTRB(45, 16, 8, 16),
                            // scrollDirection: Axis.horizontal,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //? Internships
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              child: InkWell(
                                onTap: () => Get.toNamed("/internships"),
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/internship_colored.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Internships",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),
                            // SizedBox(
                            //   width: 80,
                            // ),

                            //? Exams
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              child: InkWell(
                                onTap: () => Get.toNamed("/exam"),
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: AssetImage("assets/exam.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Exams",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),
                            //registration
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              child: InkWell(
                                onTap: () =>
                                    Get.toNamed("/registration_screen"),
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image:
                                          AssetImage("assets/registration.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Registration",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Text('Practitioners Modules',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        SingleChildScrollView(
                            // scrollDirection: Axis.horizontal,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                              child: InkWell(
                                onTap: () => Get.toNamed("/licence_screen"),
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/license_manager.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Licence",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),

                            SizedBox(
                              width: 100,
                            ),

                            //? CPD
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed("/CPD");
                                },
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/icons8-self-service-48.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("CPDs",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Text('General',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        SingleChildScrollView(
                            // padding: const EdgeInsets.fromLTRB(45, 16, 8, 16),
                            // scrollDirection: Axis.horizontal,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        )),
                        SingleChildScrollView(
                            // padding: const EdgeInsets.fromLTRB(45, 16, 8, 16),
                            // scrollDirection: Axis.horizontal,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //? Knowledge base
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              child: InkWell(
                                onTap: () => Get.toNamed("/articles"),
                                child: Column(children: const [
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(FontAwesomeIcons.brain)),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Knowledgebase",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2)),
                                  )
                                ]),
                              ),
                            ),

                            SizedBox(
                              width: 70,
                            ),

                            //? F.A.Q
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 16, 16, 16),
                              child: InkWell(
                                onTap: () => Get.toNamed("/faq"),
                                child: Column(children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image: AssetImage("assets/question.png"),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("FAQs",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1)),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    // network.connection.value == 0
                    //     ? NetworkCheckWidget()
                    //     : SizedBox()
                  ],
                ),
              )));
  }
}
