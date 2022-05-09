import 'dart:convert';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/models/rotationareas.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class RotationAreasService {
  static Future rotationAreas(int internshipAreaId) async {
    LoginController login = Get.find();
    var headers = {
      'Authorization': 'Bearer ${login.data.value.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://aya-api.mhealthkenya.co.ke/api/internship/rotation_areas'));
    request.body = json.encode({"internship_area_id": internshipAreaId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      return rotationAreasModelFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
