import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/licenceapplications.dart';
import 'package:get/get.dart';

class LicenceApplicationsController extends GetxController {
  String method = "GET";
  var isLoading = false.obs;
  var applications = <LicenceApplications>[].obs;
  AuthenticatedUserController login = Get.put(AuthenticatedUserController());

  @override
  void onInit() {
    getLicences(login.data.value.id);
    super.onInit();
  }

  Future<void> getLicences(String? indexId) async {
    String url = "/licencing?index_id=$indexId";

    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: licenceApplicationsFromJson, indexId: login.data.value.id);

      if (response != null) {
        isLoading(false);
        applications.value = response;
      } else {
        isLoading(false);
        applications.value = <LicenceApplications>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
