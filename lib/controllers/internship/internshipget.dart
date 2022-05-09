import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/internshipget.dart';
import 'package:get/get.dart';

class InternshipGetController extends GetxController {
  String url = '/internship/get';
  String method = 'GET';
  var isLoading = false.obs;
  var data = <InternshipGet>[].obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getInternships();
    super.onInit();
  }

  Future<void> getInternships() async {
    isLoading(true);
    var response = await BaseResponse().makeApiCall(method, url,
        fromModel: internshipGetFromJson, token: controller.data.value.token);
    if (response != null) {
      isLoading(false);
      data.value = response;
    } else {
      isLoading(false);
      data.value = <InternshipGet>[];
    }
  }
}
