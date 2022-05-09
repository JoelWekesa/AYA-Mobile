// ignore_for_file: prefer_const_constructors

import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Licence extends StatelessWidget {
  const Licence({
    Key? key,
    required this.authenticatedUser,
    required this.formatter,
  }) : super(key: key);

  final AuthenticatedUserController authenticatedUser;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: authenticatedUser.data.value.license!.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                            height: 30,
                            child: Text("Licence Number",
                                style: TextStyle(color: Colors.grey))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          width: 200,
                          height: 30,
                          child: Text(
                              "${authenticatedUser.data.value.license![index].licenseNo}",
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 30,
                          child: Text("Work Station",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          width: 200,
                          height: 30,
                          child: Text(
                              "${authenticatedUser.data.value.license![index].workStation}",
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 5),
                  //   ],
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 30,
                          child: Text("From Date",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 30,
                          child: Text(
                              formatter.format(DateTime.parse(
                                  "${authenticatedUser.data.value.license![index].fromDate}")),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 30,
                          child: Text("Exp Date",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 30,
                          child: Text(
                              formatter.format(DateTime.parse(
                                  "${authenticatedUser.data.value.license![index].toDate}")),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                // ],
              // ),
            ));
      },
    );
  }
}
