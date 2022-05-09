// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/palette.dart';
import 'package:flutter/material.dart';

Widget pageContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Palette.kToDark),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 179, 198, 249),
              Color.fromARGB(255, 237, 243, 236),
            ],
          )),
      child: child);
}
