// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NetworkCheckWidget extends StatelessWidget {
  const NetworkCheckWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 100,
      right: 100,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Not connected to the internet",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(letterSpacing: 2, color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
