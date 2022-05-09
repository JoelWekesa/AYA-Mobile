// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/palette.dart';
import 'package:flutter/material.dart';

Padding customContainer(Widget content) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
        width: double.infinity,
        child: Padding(padding: const EdgeInsets.all(10.0), child: content),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 156, 164, 179)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 179, 198, 249),
                Color.fromARGB(255, 237, 243, 236),
              ],
            ))),
  );
}
