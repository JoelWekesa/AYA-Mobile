// ignore_for_file: prefer_const_constructors

import 'package:aya2/pages/licence/licenceapplication.dart';
import 'package:aya2/pages/licence/licencehistory.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';

class LicencesScreen extends StatefulWidget {
  const LicencesScreen({Key? key}) : super(key: key);

  @override
  State<LicencesScreen> createState() => _LicencesScreenState();
}

class _LicencesScreenState extends State<LicencesScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.initState();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(),
      appBar: AppBar(
        title: Text("Licence"),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.amberAccent,
          isScrollable: true,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(child: Text('Licence Application')),
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
            child: LicenceApplicationsPage(),
          ),
          Center(
            child: LicenceHistory(),
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
