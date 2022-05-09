import 'package:aya2/palette.dart';
import 'package:aya2/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Palette.kToDark,
        primaryColor: Colors.cyan,

        scaffoldBackgroundColor: Colors.grey[200],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Hind',
                letterSpacing: 2,
                color: Palette.kToDark),
            headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Hind',
                letterSpacing: 2.5,
                color: Palette.kToDark,
                fontWeight: FontWeight.w300),
            caption: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Hind',
                letterSpacing: 2.5,
                color: Palette.kToDark,
                fontWeight: FontWeight.w500),
            headline3: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: allRoutes));
}
