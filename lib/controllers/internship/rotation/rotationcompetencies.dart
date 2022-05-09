import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/rotationcompetencies.dart';
import 'package:get/get.dart';

class RotationCompetenciesController extends GetxController {
  String url = '/internship/rotation_competencies';
  String method = 'POST';
  var isLoading = false.obs;
  var data = RotationCompetencies().obs;

  Future getCompetencies(rotationId) async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          body: {"rotation_id": rotationId},
          fromModel: rotationCompetenciesFromJson);
      if (response != null) {
        isLoading(false);
        data.value = response;
      } else {
        isLoading(false);
        data.value = RotationCompetencies();
      }
    } finally {
      isLoading(false);
    }
  }
}
