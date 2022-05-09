// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget centerText(String text) => Center(
    child: Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                letterSpacing: 2, fontSize: 16, color: Colors.black87))));
