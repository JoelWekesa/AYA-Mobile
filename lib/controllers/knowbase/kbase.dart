import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/knowbase/kbase.dart';
import 'package:get/get.dart';

class KBaseController extends GetxController {
  var isLoading = false.obs;
  var data = <KbaseModel>[].obs;

  @override
  void onInit() {
    getAllItems();
    super.onInit();
  }

  Future<void> getAllItems() async {
    try {
      var response = await BaseResponse().makeApiCall(
        "GET",
        "/kbase",
        fromModel: kbaseModelFromJson,
      );
      if (response != null) {
        data.value = response;
      } else {
        data.value = <KbaseModel>[];
      }
    } finally {
      isLoading.value = false;
    }
  }
}
