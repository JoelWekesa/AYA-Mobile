import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/internship_transfer_get.dart';
import 'package:get/get.dart';

class InternshipGetTransferController extends GetxController {
  String url = '/internship/transfer_history';
  String method = 'GET';
  var isLoading = false.obs;
  var data = <InternshipTransferGet>[].obs;
  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getInternshipTransfer();
    super.onInit();
  }

  Future<void> getInternshipTransfer() async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, fromModel: internshipTransferGetFromJson, token: controller.data.value.token);
    if (response != null) {
      isLoading(false);
      data.value = response;
    } else {
      isLoading(false);
      data.value = <InternshipTransferGet>[];
    }
  }
}
