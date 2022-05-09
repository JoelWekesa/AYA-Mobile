import 'package:aya2/helpers/competency.dart';
import 'package:aya2/models/competency.dart';
import 'package:get/get.dart';

class CompetencySummaryController extends GetxController {
  var isLoading = false.obs;
  var competencies = <CompetencySummaryModel>[].obs;

  Future<void> getComptenciesSummary(
      String internshipId, String intershipRotationId) async {
    try {
      isLoading(true);
      var response = await CompetencySummaryService.getCompetencies(
          internshipId, intershipRotationId);
      if (response != null) {
        isLoading(false);
        competencies.value = response;
      } else {
        isLoading(false);
        competencies.value = <CompetencySummaryModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
