import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/checkinget.dart';
import 'package:get/get.dart';

class CheckinGetController extends GetxController {
  String method = "GET";
  String url = "/checkin";
  var isLoading = false.obs;
  var success = false.obs;
  var data = <CheckinGet>[].obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getCheckins();
    super.onInit();
  }

  Future<void> getCheckins() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: checkinGetFromJson, token: controller.data.value.token);
      if (response != null) {
        isLoading(false);
        success(true);
        data.value = response;
        // print(data);
      } else {
        isLoading(false);
        success(false);
        data.value = <CheckinGet>[];
        // print(data);
      }
    } finally {
      isLoading(false);
    }
  }
}
