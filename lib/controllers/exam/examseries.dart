import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/exams/examseries.dart';
import 'package:get/get.dart';

class ExamSeriesController extends GetxController {
  var isLoading = false.obs;
  var data = <ExamSeriesModel>[].obs;

  @override
  void onInit() {
    getExamSeries();
    super.onInit();
  }

  Future<void> getExamSeries() async {
    isLoading(true);
    var response = await BaseResponse().makeApiCall('GET',
        '/exams/series?index_id=105501', //Be sure to replace this with your index id in production
        fromModel: examSeriesModelFromJson);
    if (response != null) {
      isLoading(false);
      data.value = response;
      print(response);
    } else {
      isLoading(false);
      data.value = <ExamSeriesModel>[];
    }
  }
}
