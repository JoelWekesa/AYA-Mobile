import 'package:aya2/models/categories.dart';
import 'package:get/get.dart';
import 'package:aya2/helpers/baseresponse.dart';

class CategoriesController extends GetxController {
  String url = "/CPD/categories";
  var method = "GET";
  var isLoading = false.obs;
  var categories = <Categories>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: categoriesFromJson);

      if (response != null) {
        isLoading(false);
        categories.value = response;
      } else {
        isLoading(false);
        categories.value = <Categories>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
