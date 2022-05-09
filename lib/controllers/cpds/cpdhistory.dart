import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/cpdget.dart';
import 'package:get/get.dart';

class CpdGetController extends GetxController {
  String method = "GET";
  var isLoading = false.obs;
  var cpds = <CpdGet>[].obs;
  AuthenticatedUserController login = Get.put(AuthenticatedUserController());

  @override
  void onInit() {
    getCpds(login.data.value.id);
    super.onInit();
  }

  Future<void> getCpds(String? indexId) async {
    String url = "/CPD/activity_history?index_id=$indexId";

    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: cpdGetFromJson, indexId: login.data.value.id);

      if (response != null) {
        isLoading(false);
        cpds.value = response;
      } else {
        isLoading(false);
        cpds.value = <CpdGet>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
