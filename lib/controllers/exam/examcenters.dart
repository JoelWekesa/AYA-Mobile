import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/examcenters.dart';
import 'package:aya2/models/exams/examcenters.dart';
import 'package:get/get.dart';

class ExamCentersController extends GetxController {
  String url = '/exams/centers';
  String method = 'GET';
  var isLoading = false.obs;
  var data = <ExamCentersModel>[].obs;

  @override
  void onInit() {
    getExamCenters();
    super.onInit();
  }

  Future<void> getExamCenters() async {
    try {
      isLoading(true);
      var response =
          await BaseResponse().makeApiCall(method, url, fromModel: examCentersModelFromJson);
      if (response != null) {
        isLoading(false);
        data.value = response;
      } else {
        isLoading(false);
        data.value = <ExamCentersModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
