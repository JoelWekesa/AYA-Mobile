import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/examresults.dart';
import 'package:get/get.dart';

class ExamResultController extends GetxController {
  String url = '/exams/results?index_id=82529';
  String method = 'GET';
  var isLoading = false.obs;
  var success = false.obs;
  var examresults = <ExamResults>[].obs;
  AuthenticatedUserController authenticatedUser = Get.find();

  @override
  void onInit() {
    getResults(authenticatedUser.data.value.id);
    super.onInit();
  }

  Future<void> getResults(String? indexId) async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: examResultsFromJson);
      //ExamGetService.getAllExams(indexId!);
      if (response != null) {
        isLoading(false);
        success(true);
        examresults.value = response;
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
