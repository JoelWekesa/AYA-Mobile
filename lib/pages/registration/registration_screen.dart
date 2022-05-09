// ignore_for_file: prefer_const_constructors

import 'package:aya2/pages/registration/registration.dart';
import 'package:aya2/pages/registration/registrationshist.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  // ignore: unused_field
  // late TabController _tabController;
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
        title: Text("Registration"),
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.amberAccent,
          isScrollable: true,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(child: Text('Registration')),
            Tab(child: Text('My Registrations')),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: RegistrationPage(),
          ),
          Center(
            child: RegistrationsHistPage(),
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
