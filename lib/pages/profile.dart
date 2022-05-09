import 'package:aya2/components/biodata.dart';
import 'package:aya2/components/cpd.dart';
import 'package:aya2/components/education.dart';
import 'package:aya2/components/licence.dart';
import 'package:aya2/components/registration.dart';
import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/screens/appbar.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  AuthenticatedUserController authenticatedUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: mainDrawer(),
        // ignore: prefer_const_constructors
        // appBar: CustomAppBar(title: "Profile"),
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  //backgroundColor: Colors.grey,
                  child: Image.network(
                    "${authenticatedUser.controller.data.value.profilePic}",
                    width: 100,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("${authenticatedUser.controller.data.value.name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  //Tab Bar
                  const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(
                          child: Text("Biodata",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("Education",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("Registration",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("Licence",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("CPDs",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),

                  // Tab bar view
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: BioData(
                                authenticatedUser: authenticatedUser,
                                formatter: formatter),
                          ),
                          Education(
                              authenticatedUser: authenticatedUser,
                              formatter: formatter),
                          Registration(
                              authenticatedUser: authenticatedUser,
                              formatter: formatter),
                          Licence(
                              authenticatedUser: authenticatedUser,
                              formatter: formatter),
                          MyCpdscreen(
                              authenticatedUser: authenticatedUser,
                              formatter: formatter),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(
                "/editprofile",
              );
            },
            child: Image.asset('assets/edit.png')),
      ),
    );
  }
}
