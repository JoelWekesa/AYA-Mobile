import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/examget.dart';
import 'package:get/get.dart';

class ExamGetController extends GetxController {
  String url = '/exams/applications?index_id=105501';
  String method = 'GET';
  var isLoading = false.obs;
  var success = false.obs;
  var exams = <ExamGet>[].obs;
  AuthenticatedUserController authenticatedUser = Get.find();

  @override
  void onInit() {
    getExams(authenticatedUser.data.value.id);
    super.onInit();
  }

  Future<void> getExams(String? indexId) async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: examGetFromJson);
      //ExamGetService.getAllExams(indexId!);
      if (response != null) {
        isLoading(false);
        success(true);
        exams.value = response;
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
      // showDialogFail("Sorry", "No Examinations Available for viewing");
    }
  }
}
