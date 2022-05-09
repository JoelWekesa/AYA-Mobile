import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/exams/examshistory.dart';
import 'package:get/get.dart';



class ExamHistoryController extends GetxController {
  var isLoading = false.obs;
  var data = <ExamsHistoryModel>[].obs;

  AuthenticatedUserController authenticatedUser = Get.put(AuthenticatedUserController());

  @override
  void onInit() {
    getExamHistory();
    super.onInit();
  }

  Future<void> getExamHistory() async {
    isLoading(true);
    var response = await BaseResponse().makeApiCall(
        'GET', '/exams/applications?index_id=${authenticatedUser.data.value.id}',
        fromModel: examsHistoryModelFromJson);
    if (response != null) {
      isLoading(false);
      data.value = response;
    } else {
      isLoading(false);
      data.value = <ExamsHistoryModel>[];
    }
  }
}
