import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/knowbase/subarticles.dart';
import 'package:get/get.dart';

class SubArticlesController extends GetxController {
  var isLoading = false.obs;
  var data = <SubArticlesMode>[].obs;

  @override
  void onInit() {
    getAllSubArticles("");
    super.onInit();
  }

  Future<void> getAllSubArticles(String term) async {
    isLoading.value = true;
    try {
      var response = await BaseResponse().makeApiCall(
        "GET",
        "/knowbase/subarticles",
        fromModel: subArticlesModeFromJson,
      );
      if (response != null) {
        data.value = response
            .where((SubArticlesMode article) =>
                article.articleTitle!.toLowerCase().contains(term.toLowerCase()) ||
                article.subarticleTitle!.toLowerCase().contains(term.toLowerCase()) ||
                article.content!.toLowerCase().contains(term.toLowerCase()))
            .toList();
      } else {
        data.value = <SubArticlesMode>[];
      }
    } finally {
      isLoading.value = false;
    }
  }
}
