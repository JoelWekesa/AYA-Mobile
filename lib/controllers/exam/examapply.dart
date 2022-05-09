import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/examapply.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExamApplyController extends GetxController {
  String url = '/exams/apply';
  String method = 'POST';
  var isLoading = false.obs;
  var success = false.obs;
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> applyForExam(String data, String examCenters) async {
    try {
      isLoading(true).obs;
      var response = await BaseResponse().makeApiCall(method, url,
          body: {
            "student_series_id": data,
            "index_id": "105501",
            "exam_centers": examCenters,
            "application_date": formatter.format(now)
          },
          fromModel: examApplyFromJson);
      if (response != null) {
        isLoading(false);
        success(true);
        showDialogSuccess("Success", "Exam Application Successfull");
        Get.offAndToNamed("/exams");
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
