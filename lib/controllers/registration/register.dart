// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/register.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  String url = "/auth/registration/apply";
  String method = "POST";
  var isLoading = false.obs;
  var success = false.obs;
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> registerUser(String education_id, File current_passport) async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          body: {
            "education_id": education_id,
            "current_passport":
                "current_passport", //Changed this as it was not working. Cannot accept file type as json. Please consider adding a method to accept file in the base response or base create
            'application_date': formatter.format(now)
          },
          fromModel: registerModelFromJson);
      if (response != null) {
        isLoading(false);
        success(true);
        Get.toNamed("/registration");
        showDialogSuccess("Success", "Registration application received");
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
