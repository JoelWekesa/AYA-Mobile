// ignore_for_file: prefer_const_constructors

import 'package:aya2/pages/cpds/cpdhistory.dart';
import 'package:aya2/pages/cpds/cpdselfreport.dart';
import 'package:aya2/pages/internship/internshipapplication.dart';
import 'package:aya2/pages/internship/internshipget.dart';
import 'package:aya2/pages/internship/rotations/rotations.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/auth/authenticated.dart';
import 'package:get/get.dart';

class InternshipScreen extends StatefulWidget {
  const InternshipScreen({Key? key}) : super(key: key);

  @override
  State<InternshipScreen> createState() => _InternshipScreenState();
}

class _InternshipScreenState extends State<InternshipScreen>
    with TickerProviderStateMixin {
  // ignore: unused_field
  // late TabController _tabController;
  TabController? _tabController;

  AuthenticatedUserController authUser = Get.put(AuthenticatedUserController());
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(),
      appBar: AppBar(
        title: Text("Internship"),
        bottom: TabBar(
          // unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          indicatorColor: Colors.amberAccent,
          isScrollable: true,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(child: Text('Application')),
            Tab(child: Text('Log Rotations')),
            Tab(child: Text('History')),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: InternshipApplication(),
          ),
          Center(
            child: RotaionsPage(),
          ),
          // Center(
          //   child: InternshipGetPage(),
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Get.toNamed("/internshiphist"),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Palette.kToDark, width: 1.0)),
                  leading: Icon(
                    FontAwesomeIcons.userNurse,
                    color: Palette.kToDark,
                  ),
                  title: Text("Internships",
                      style: TextStyle(color: Palette.kToDark)),
                  trailing: Icon(
                    FontAwesomeIcons.chevronCircleRight,
                    color: Palette.kToDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Get.toNamed("/rotationhist"),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Palette.kToDark, width: 1.0)),
                  leading: Icon(
                    FontAwesomeIcons.briefcaseMedical,
                    color: Palette.kToDark,
                  ),
                  title: Text("Rotations",
                      style: TextStyle(color: Palette.kToDark)),
                  trailing: Icon(
                    FontAwesomeIcons.chevronCircleRight,
                    color: Palette.kToDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Get.toNamed("/transferhist"),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Palette.kToDark, width: 1.0)),
                  leading: Icon(
                    FontAwesomeIcons.exchangeAlt,
                    color: Palette.kToDark,
                  ),
                  title: Text("Transfers",
                      style: TextStyle(color: Palette.kToDark)),
                  trailing: Icon(
                    FontAwesomeIcons.chevronCircleRight,
                    color: Palette.kToDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => Get.toNamed("/checkinhist"),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Palette.kToDark, width: 1.0)),
                  leading: Icon(
                    FontAwesomeIcons.layerGroup,
                    color: Palette.kToDark,
                  ),
                  title: Text("Checkins",
                      style: TextStyle(color: Palette.kToDark)),
                  trailing: Icon(
                    FontAwesomeIcons.chevronCircleRight,
                    color: Palette.kToDark,
                  ),
                ),
              )
            ],
          )
        ],
        controller: _tabController,
      ),
    );
  }
}
