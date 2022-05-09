// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aya2/palette.dart';
import 'package:flutter/material.dart';

Widget payInstructions(BuildContext context, dynamic data) {
  return Column(children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Payment Instructions", style: Theme.of(context).textTheme.headline6),
    ),
    SizedBox(height: 10),
    ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "1. Go to M-PESA menu on your phone",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "2. Select Lipa na M-PESA",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "3. Select Pay Bill",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "4. Enter Pay Bill Number 123456",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "5. Enter Account Number ${data.invoiceNo!}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "6. Enter Amount ${data.amountDue!}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "7. Enter your M-PESA PIN",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "8. Submit Payment",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "9. Wait for confirmation",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    ),

    // Application Date
  ]);
}
