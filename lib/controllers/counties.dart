import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/counties.dart';
import 'package:get/get.dart';

class CountiesController extends GetxController {
  String url = "/licencing/counties";
  String method = "GET";
  var isLoading = false.obs;
  var counties = <Counties>[].obs;

  @override
  void onInit() {
    getCounties();
    super.onInit();
  }

  Future<void> getCounties() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: countiesFromJson);
      if (response != null) {
        isLoading(false);
        counties.value = response;
      } else {
        isLoading(false);
        counties.value = <Counties>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
