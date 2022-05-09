import 'dart:convert';

import 'package:aya2/screens/dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class BaseCreate {
  static var client = http.Client();
  String baseUrl = "https://aya-api.mhealthkenya.co.ke/api";

  Future makeApiCall(String url,
      {Map<String, String>? body,
      dynamic fromModel,
      String? token,
      String? indexId}) async {
    Uri finalUrl = Uri.parse(baseUrl + url);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST', finalUrl);
    request.body = json.encode(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      showDialogSuccess("Success", "Successfully Created");
      String jsonString = await response.stream.bytesToString();
      return jsonString;
    } else if (response.statusCode == 201) {
      showDialogSuccess("Success", "Created Successfully");
      String jsonString = await response.stream.bytesToString();
      return jsonString;
    } else {
      String? jsonString = response.reasonPhrase;
      showDialogFail("Error", jsonString);
      return null;
    }
  }

  Future sendSTK({Map<String, String>? body}) async {
    Uri finalUrl = Uri.parse(baseUrl + "/payment/stkPush");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', finalUrl);
    request.body = json.encode(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Get.back();
    } else {
      String? jsonString = response.reasonPhrase;
      showDialogFail("Error", jsonString);
    }
  }

  Future makeApiCallWithFile(String url, Map<String, String>? body,
      String? filename, PlatformFile file) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    request.fields.addAll(body!);
    request.files.add(await http.MultipartFile.fromPath(filename!, file.path!));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialogSuccess("Success", "Added successfully");
    } else {
      showDialogFail("Error", "An error occurred");
    }
  }

  Future makeAPICallWithImage(String url, Map<String, String>? body,
      String? imagename, PlatformFile file,
      {String? token}) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
    request.fields.addAll(body!);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    request.files
        .add(await http.MultipartFile.fromPath(imagename!, file.path!));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialogSuccess("Success", "Successfully Created");
      print(await response.stream.bytesToString());
    } else {
      String? jsonString = response.reasonPhrase;
      showDialogFail("Error", jsonString);
    }
  }
}
