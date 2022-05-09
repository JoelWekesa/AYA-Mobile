import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/exams/examcard.dart';
import 'package:get/get.dart';

class ExamCardController extends GetxController {
  var isLoading = false.obs;
  var data = <ExamCardModel>[].obs;

  @override
  void onInit() {
    getExamCard();
    super.onInit();
  }

  Future<void> getExamCard() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall('GET', '/exams/examcard?index_id=82529',
          fromModel:
              examCardModelFromJson); //Be sure to replace this with your index id in production
      if (response != null) {
        isLoading(false);
        data.value = response;
      } else {
        isLoading(false);
        data.value = <ExamCardModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
