import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/knowbase/articles.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController {
  var isLoading = false.obs;
  var data = <ArticlesModel>[].obs;

  @override
  void onInit() {
    getAllArticles();
    super.onInit();
  }

  Future<void> getAllArticles() async {
    try {
      var response = await BaseResponse().makeApiCall(
        "GET",
        "/knowbase",
        fromModel: articlesModelFromJson,
      );
      if (response != null) {
        data.value = response;
      } else {
        data.value = <ArticlesModel>[];
      }
    } finally {
      isLoading.value = false;
    }
  }
}
