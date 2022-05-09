import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/registrationsget.dart';
import 'package:get/get.dart';

class RegistrationsGetController extends GetxController {
  String url = '/auth/registration/applications';
  String method = 'GET';
  var isLoading = false.obs;
  var success = false.obs;
  var registrations = GetRegistrationsModel().obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getRegistrations();
    super.onInit();
  }

  Future<void> getRegistrations() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: getRegistrationsModelFromJson,
          token: controller.data.value.token);
      if (response != null) {
        isLoading(false);
        success(true);
        registrations.value = response;
      } else {
        isLoading(false);
        success(false);
        registrations.value = GetRegistrationsModel();
      }
    } finally {
      isLoading(false);
    }
  }
}
