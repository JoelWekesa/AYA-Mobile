import 'package:aya2/helpers/baseresponse.dart';
import 'package:get/get.dart';
import '../models/examseries.dart';

class ExamSeriesController extends GetxController {
  String url = '/exams/series?index_id=105501';
  String method = 'GET';
  var isLoading = false.obs;
  var data = <ExamSeries>[].obs;

  @override
  void onInit() {
    getExamSeries();
    super.onInit();
  }

  Future<void> getExamSeries() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: examSeriesFromJson);
      if (response != null) {
        isLoading(false);
        data.value = response;
      } else {
        isLoading(false);
        data.value = <ExamSeries>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
