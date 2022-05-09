// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void showDialogFail(title, message) async {
  Get.snackbar(
    title,
    message,
    // message
    colorText: Colors.white,
    backgroundColor: Color.fromRGBO(255, 95, 89, 1),
    icon: Icon(FontAwesomeIcons.exclamation, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
    duration: Duration(seconds: 5),
  );
}

void showDialogSuccess(title, message) async {
  Get.snackbar(
    title,
    message,
    // message
    colorText: Colors.white,
    backgroundColor: Color.fromRGBO(107, 177, 32, 1),
    icon: Icon(FontAwesomeIcons.check, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
    duration: Duration(seconds: 3),
  );
}

void showDialogInfo(title, message) async {
  Get.snackbar(
    title,
    message,
    // message
    colorText: Colors.white,
    backgroundColor: Colors.blueAccent,
    icon: Icon(FontAwesomeIcons.infoCircle, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
    duration: Duration(seconds: 5),
  );
}
