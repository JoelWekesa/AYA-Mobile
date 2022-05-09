import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/rotationsget.dart';
import 'package:get/get.dart';

class RotationGetController extends GetxController {
  String url = '/internship/rotation_activities/get';
  String method = 'GET';
  var isLoading = false.obs;
  var rotation = <RotationsGet>[].obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getRotation();
    super.onInit();
  }

  Future<void> getRotation() async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, fromModel: rotationsGetFromJson, token: controller.data.value.token);
    if (response != null) {
      isLoading(false);
      rotation.value = response;
    } else {
      isLoading(false);
      rotation.value = <RotationsGet>[];
      print(rotation);
    }
  }
}
