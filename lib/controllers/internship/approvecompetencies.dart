import 'package:aya2/helpers/approvecompetencies.dart';
import 'package:get/get.dart';

class ApproveCompetenciesController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;

  Future<void> approveCompetency(String internshipId, String competencyId,
      String approverName, String approverId, String approverNo) async {
    try {
      isLoading(true);
      var response = await ApproveCompetenciesService.approveCompetencies(
          internshipId, competencyId, approverName, approverId, approverNo);

      if (response != null) {
        isLoading(false);
        success(true);
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
