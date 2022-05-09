import 'dart:convert';

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/models/otp.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class OtpGetService {
  static Future getOTP(String mobileNo, String task, String? otp) async {
    LoginController login = Get.find();

    var headers = {
      'Authorization': 'Bearer ${login.data.value.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://aya-api.mhealthkenya.co.ke/api/otp/$task'));
    request.body = json.encode({
      "index_id": login.data.value.id,
      "mobile_no": mobileNo,
      "task": task,
      "otp": otp ?? "",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      showDialogSuccess("Success", "OTP sent");
      return otpModelFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
