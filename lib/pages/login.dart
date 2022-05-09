// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/controllers/network.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/network.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool obsecure = true;

  LoginController controller = Get.put(LoginController());
  NetworkController network = Get.put(NetworkController());

  void setObsecure() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.kToDark,
        body: Obx(() => Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    ClipPath(
                        clipper: JoesClipper(),
                        child: Container(
                            child: Image(
                                alignment: Alignment.center,
                                image: AssetImage("assets/login.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                            height: 300)),
                    Flexible(
                      child: Container(
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                // Text("AYA",
                                //     style:
                                //         Theme.of(context).textTheme.headline1),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // Username Form
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextFormField(
                                            autocorrect: false,
                                            onChanged: (value) {
                                              username = value;
                                            },
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return "Please enter username";
                                              }
                                            },
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                helperStyle: TextStyle(color: Colors.white),
                                                hintText: "Username",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                prefixIcon: Icon(FontAwesomeIcons.user),
                                                helperText: ("Your username"))),
                                      ),
                                      // Password form
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: TextFormField(
                                            onChanged: (value) {
                                              password = value;
                                            },
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return "Please enter password";
                                              }
                                            },
                                            obscureText: obsecure,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                helperStyle: TextStyle(color: Colors.white),
                                                hintText: "Password",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                                helperText: ("Your password"),
                                                prefixIcon: Icon(FontAwesomeIcons.lock),
                                                suffixIcon: IconButton(
                                                    onPressed: () => setObsecure(),
                                                    icon: obsecure
                                                        ? Icon(FontAwesomeIcons.eyeSlash)
                                                        : Icon(FontAwesomeIcons.eye)))),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await controller.userLogin(
                                            {"username": username!, "password": password!});
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.all(Radius.circular(25))),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(FontAwesomeIcons.paperPlane,
                                                color: Palette.kToDark),
                                            SizedBox(width: 5),
                                            Text(controller.isLoading.value ? "Loading" : "Login",
                                                style: TextStyle(
                                                    letterSpacing: 2,
                                                    fontSize: 20,
                                                    color: Palette.kToDark))
                                          ]),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("In Partnership with...",
                                        style: TextStyle(color: Colors.grey))),
                                //? Login Icons
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      // Google icon
                                      Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/MOH.png")))),
                                      // Expanded(
                                      //     child: Container(
                                      //   margin: EdgeInsets.all(3),
                                      //   width: 100,
                                      //   height: 40,
                                      //   child: Image(
                                      //     alignment: Alignment.center,
                                      //     image: AssetImage("assets/MOH.png"),
                                      //   ),
                                      // )),
                                      Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/AGUH.png")))),
                      
                                      // Expanded(
                                      //     child: Container(
                                      //   margin: EdgeInsets.all(3),
                                      //   width: 200,
                                      //   height: 40,
                                      //   child: Image(
                                      //     alignment: Alignment.center,
                                      //     image: AssetImage("assets/AGUH.png"),
                                      //   ),
                                      // )),
                      
                                      Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/nck.jpeg")))),
                      
                                      // Expanded(
                                      //     child: Container(
                                      //   margin: EdgeInsets.all(3),
                                      //   width: 200,
                                      //   height: 40,
                                      //   child: Image(
                                      //     alignment: Alignment.center,
                                      //     image: AssetImage("assets/nck.jpeg"),
                                      //   ),
                                      // )),
                      
                                      Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/mhealogo.jpeg")))),
                                      // Expanded(
                                      //     child: Container(
                                      //   margin: EdgeInsets.all(3),
                                      //   width: 200,
                                      //   height: 40,
                                      //   child: Image(
                                      //     alignment: Alignment.center,
                                      //     image: AssetImage(
                                      //         "assets/mhealogo.jpeg"),
                                      //   ),
                                      // )),
                                    ],
                                  ),
                                ),
                              ]))),
                    )
                  ],
                ),
                // Positioned(
                //   bottom: 2,
                //   child: Center(
                //       child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("Nursing Council of Kenya",
                //         style: Theme.of(context).textTheme.bodyText2),
                //   )),
                // ),
                network.connection.value == 0 ? NetworkCheckWidget() : SizedBox()
              ],
            )));
  }
}

class JoesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.cubicTo(size.width * 0.0241250, size.height * 0.5754750, size.width * 0.0108250,
        size.height * 0.6267000, size.width * 0.1888750, size.height * 0.6261000);
    path.cubicTo(size.width * 0.3590625, size.height * 0.6319500, size.width * 0.7043125,
        size.height * 0.6296750, size.width * 0.8599375, size.height * 0.6334750);
    path.quadraticBezierTo(
        size.width * 0.9867625, size.height * 0.6339000, size.width, size.height * 0.9966500);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.7500000, 0, 0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
