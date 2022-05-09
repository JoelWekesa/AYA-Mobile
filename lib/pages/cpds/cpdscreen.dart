// ignore_for_file: prefer_const_constructors

import 'package:aya2/pages/cpds/cpdhistory.dart';
import 'package:aya2/pages/cpds/cpdselfreport.dart';
import 'package:aya2/pages/cpds/wcea.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/auth/authenticated.dart';
import 'package:get/get.dart';

class CpdPage extends StatefulWidget {
  const CpdPage({Key? key}) : super(key: key);

  @override
  State<CpdPage> createState() => _CpdPageState();
}

class _CpdPageState extends State<CpdPage> with TickerProviderStateMixin {
  // ignore: unused_field
  // late TabController _tabController;
  TabController? _tabController;

  AuthenticatedUserController authUser = Get.put(AuthenticatedUserController());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.initState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(),
      appBar: AppBar(
        title: Text("CPD"),
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.amberAccent,
          isScrollable: true,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            // Tab(child: Text('Self Report')),
            Tab(
                child: Text(
              'Activity History',
              style: TextStyle(
                fontSize: 15,
              ),
            )),
            Tab(
                child: Text(
              'WCEA',
              style: TextStyle(
                fontSize: 15,
              ),
            )),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // Center(
          //   child: CpdSelfReportPage(),
          // ),
          Center(
            child: CpdHistory(),
          ),
          Center(
            child: WceaPage(),
          ),
        ],
        controller: _tabController,
      ),
       floatingActionButton: FloatingActionButton.extended(
        elevation: 0.0,
        onPressed: () {
          Get.toNamed(
            "/selfreport",
          );
        },
        label: const Text('Add CPD'),
        icon: const Icon(FontAwesomeIcons.plus),
        // child: Text("Add CPD",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //     ))
        // child: Image.asset('assets/icons8-self-service-48.png')
      ),
    );
  }
}
