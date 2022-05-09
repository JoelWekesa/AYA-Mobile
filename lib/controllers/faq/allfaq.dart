import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/faqs.dart';
import 'package:get/get.dart';

class FAQController extends GetxController {
  String method = "GET";
  String url = "/faqs";
  var isLoading = false.obs;
  var data = <FaQsModel>[].obs;

  @override
  void onInit() {
    getAllFaQs();
    super.onInit();
  }

  Future<void> getAllFaQs() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url, fromModel: faQsModelFromJson);
      if (response != null) {
        isLoading(false);
        data.value = response;
      } else {
        isLoading(false);
        data.value = <FaQsModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
