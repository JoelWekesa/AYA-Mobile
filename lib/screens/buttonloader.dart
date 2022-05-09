// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    );
  }
}

class ButtonLoaderWhite extends StatelessWidget {
  const ButtonLoaderWhite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Color.fromARGB(255, 1, 17, 31),
      size: 50.0,
    );
  }
}
