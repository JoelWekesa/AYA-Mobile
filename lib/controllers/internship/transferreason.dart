import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/transferreason.dart';
import 'package:get/get.dart';

class TransferReasonController extends GetxController {
  String url = '/internship/reasons';
  String method = 'GET';
  var isLoading = false.obs;
  var reasons = <InternshipReason>[].obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getReasons();
    super.onInit();
  }

  Future<void> getReasons() async {
    isLoading(true);
    try {
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: internshipReasonFromJson, token: controller.data.value.token);
      if (response != null) {
        isLoading(false);
        reasons.value = response;
      } else {
        isLoading(false);
        reasons.value = <InternshipReason>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
