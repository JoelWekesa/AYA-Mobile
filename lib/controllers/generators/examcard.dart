// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:aya2/controllers/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfExamCardApi {
  static Future<File> generate(dynamic card) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(card),
        SizedBox(height: 3 * PdfPageFormat.cm),
        // buildTitle(),
        Divider(),
        buildContent(card),
      ],
      footer: (context) => buildFooter(),
    ));

    return PdfApi.saveDocument(name: 'exam_card.pdf', pdf: pdf);
  }

  static Widget buildHeader(dynamic card) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text("NCK Exam Card",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
              ]),
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: card.indexNumber!,
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text(card.examCenter!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2)),
        ],
      );

  static Widget buildTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exam Card',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text("Downloadable Exam Card", style: TextStyle(fontSize: 12)),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildContent(dynamic card) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Full Name',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.fullName!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Index Number',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.indexNumber!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'ID Number',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.idNumber!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Exam Dates',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.examDates!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Papers Applied',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.papersApplied!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'School',
              style: TextStyle(fontSize: 18, letterSpacing: 2),
            ),
            Text(
              card.school!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: "P.O Box 20056 - 00200, Nairobi"),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Phone', value: "+254733924669"),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
