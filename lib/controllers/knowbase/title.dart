import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/knowbase/title.dart';
import 'package:get/get.dart';

class AddArticleTitleController extends GetxController {
  var isLoading = false.obs;
  var data = TitleModel().obs;

  Future<void> addArticle(String title) async {
    String method = "POST";
    String url = "/knowbase";
    isLoading.value = true; 
    Map<String, String> body = {
      "title": title,
    };
    var response =
        await BaseResponse().makeApiCall(method, url, body: body, fromModel: titleModelFromJson);

    if (response != null) {
      data.value = response;
      isLoading.value = false;
    } else {
      data.value = TitleModel();
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
