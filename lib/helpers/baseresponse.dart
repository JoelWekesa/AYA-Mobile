import 'dart:convert';

import 'package:aya2/models/counties.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import "package:http/http.dart" as http;

class BaseResponse {
  static var client = http.Client();
  String baseUrl = "https://aya-api.mhealthkenya.co.ke/api";

  Future makeApiCall(String method, String url,
      {Map<String, String>? body, dynamic fromModel, String? token, String? indexId}) async {
    Uri finalUrl = Uri.parse(baseUrl + url);
    switch (method) {
      case "GET":
        var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
        var request = http.Request("GET", finalUrl);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          String jsonString = await response.stream.bytesToString();
          return fromModel(jsonString);
        } else {
          String? jsonString = response.reasonPhrase;
          showDialogFail("Error", jsonString);
          return null;
        }
      case "POST":
        var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
        var request = http.Request('POST', finalUrl);
        request.body = json.encode(body);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String jsonString = await response.stream.bytesToString();
          return fromModel(jsonString);
        } else {
          String? jsonString = response.reasonPhrase;
          showDialogFail("Error", jsonString);
          return null;
        }

      case "DELETE":
        var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
        var request = http.Request('DELETE', finalUrl);
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          showDialogSuccess("Success", "Deleted");
          break;
        } else {
          showDialogFail("Error", response.reasonPhrase);
          break;
        }
      default:
        if (kDebugMode) {
          print("I'm not sending a GET request, $url");
        }
        break;
    }
  }
}
