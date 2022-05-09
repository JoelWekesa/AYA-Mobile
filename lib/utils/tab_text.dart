// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tabText(String text) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(text,
  overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              letterSpacing: 2, fontSize: 14))),
);
