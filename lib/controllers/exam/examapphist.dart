import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:get/get.dart';

import '../../models/examapphist.dart';

class ExamAppHistController extends GetxController {
  String url = "/exams/applications?index_id=105501";
  String method = "GET";
  var isLoading = false.obs;
  var data = <ExamAppHistory>[].obs;
  AuthenticatedUserController login = Get.put(AuthenticatedUserController());

  @override
  void onInit() {
    getExamApps();
    super.onInit();
  }

  Future<void> getExamApps() async {
    // String url = "/exams/applications?index_id=$indexId";
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, fromModel: ExamAppHistoryFromJson);
    if (response != null) {
      isLoading(false);
      data.value = response;
    } else {
      isLoading(false);
      data.value = <ExamAppHistory>[];
    }
  }
}
