import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/login.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String url = "/auth/login";
  String method = "POST";
  var isLoading = false.obs;
  var data = Login().obs;
  var success = false.obs;

  Future<void> userLogin(Map<String, String> body) async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, body: body, fromModel: loginFromJson);
    if (response != null) {
      showDialogSuccess("Success", "Logged in successfully");
      data.value = response;
      isLoading(false);
      Get.toNamed("/");
    } else {
      data.value = Login();
      isLoading(false);
    }
  }

  void userLogout() async {
    success(false);
    Get.offAllNamed("/login");
  }
}
