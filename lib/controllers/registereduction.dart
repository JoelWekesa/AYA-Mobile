import 'package:aya2/models/education.dart';
import 'dart:io';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/register.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class RegisterEducationController extends GetxController {
  String url = "/auth/education";
  String method = "GET";
  var isLoading = false.obs;
  var success = false.obs;
  List education = <EducationModel>[].obs;

  @override
  void onInit() {
    getEducation();
    super.onInit();
  }

  Future<void> getEducation() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: educationModelFromJson);
      if (response != null) {
        isLoading(false);
        success(true);
        for (var educ in response) {
          if (educ.eligibleForRegistration != "FALSE") {
            education.add(educ);
          }
        }
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
