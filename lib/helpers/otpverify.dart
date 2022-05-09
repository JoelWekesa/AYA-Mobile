import 'dart:convert';

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseurl.dart';
import 'package:aya2/models/otppverify.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class OtpGetVerifyService {
  static Future getOTP(String mobileNo, String otp) async {
    LoginController login = Get.find();
    var url = BaseURL();
    var headers = {
      'Authorization': 'Bearer ${login.data.value.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${url()}/otp/verify'));
    request.body = json.encode({
      "index_id": login.data.value.id,
      "mobile_no": mobileNo,
      "task": "verify",
      "otp": otp,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      showDialogSuccess("Success", "OTP verified");
      return otpModelVerifyFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
