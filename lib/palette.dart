//palette.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff032149, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff031e42), //10%
      100: Color(0xff021a3a), //20%
      200: Color(0xff021733), //30%
      300: Color(0xff02142c), //40%
      400: Color(0xff021125), //50%
      500: Color(0xff010d1d), //60%
      600: Color(0xff010a16), //70%
      700: Color(0xff01070f), //80%
      800: Color(0xff000307), //90%
      900: Color(0xff000000), //100%
    },
  );
}

final color = Color.fromRGBO(3, 33, 73, 0);
