// ignore_for_file: prefer_const_constructors
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WceaPage extends StatefulWidget {
  const WceaPage({Key? key}) : super(key: key);

  @override
  _WceaPageState createState() => _WceaPageState();
}

class _WceaPageState extends State<WceaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: "WCEA Live Event"),
      body: Center(
        child: InkWell(
            child: Text('Kindly click here for WCEA live event reporting.',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            onTap: () => launch('https://osp.nckenya.com')),
      ),
    );
  }
}
