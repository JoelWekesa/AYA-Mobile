// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BioData extends StatelessWidget {
  const BioData({
    Key? key,
    required this.authenticatedUser,
    required this.formatter,
  }) : super(key: key);

  final AuthenticatedUserController authenticatedUser;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    var user = authenticatedUser.data.value;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("ID Number",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${user.idNumber}", style: TextStyle(color: Colors.grey)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Gender",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${user.gender}", style: TextStyle(color: Colors.grey)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Date Of Birth",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(formatter.format(DateTime.parse("${user.dateOfBirth}")),
            style: TextStyle(color: Colors.grey)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Licence",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            authenticatedUser.data.value.license!.isNotEmpty
                ? "Number: ${user.license![0].licenseNo}"
                : "Not Available",
            style: TextStyle(color: Colors.grey)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            authenticatedUser.data.value.license!.isNotEmpty
                ? "Valid Till: ${formatter.format(DateTime.parse("${user.license![0].toDate}"))}"
                : "Not Available",
            style: TextStyle(color: Colors.grey)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.pin_drop_outlined),
                  Text("${user.address}",
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ],
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.mail),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${user.email}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      )
    ]);
  }
}
