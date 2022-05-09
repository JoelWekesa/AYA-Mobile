import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/education.dart';
import 'package:aya2/models/login.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  String url = "/auth/education";
  String method = "GET";
  var isLoading = false.obs;
  var success = false.obs;
  var education = <EducationModel>[].obs;

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
        // for (var educ in response) {
        //   if (educ.eligibleForInternship != "FALSE") {
        //     education.add(educ);
        //   } else {
        //   education.add(educ);
        //   }
        // }
        education.value = response;
        showDialogSuccess("Message", response.toString());
      } else {
        isLoading(false);
        success(false);
        education.value = <EducationModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
