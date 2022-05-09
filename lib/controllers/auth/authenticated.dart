import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/authenticated.dart';
import 'package:get/get.dart';

class AuthenticatedUserController extends GetxController {
  String method = "GET";
  String url = "/auth/user";
  var isLoading = false.obs;
  var success = false.obs;
  var data = AuthenticatedUser().obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    authenticatedUser();
    super.onInit();
  }

  Future<void> authenticatedUser() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: authenticatedUserFromJson,
          token: controller.data.value.token);

      if (response != null) {
        isLoading(false);
        success(true);
        data.value = response;
        print("testing");
      } else {
        isLoading(false);
        success(false);
        data.value = AuthenticatedUser();
      }
    } finally {
      isLoading(false);
    }
  }
}
