import 'package:aya2/helpers/rotationareas.dart';
import 'package:aya2/models/rotationareas.dart';
import 'package:get/get.dart';

class RotationAreasController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;
  var data = RotationAreasModel().obs;

  Future<void> rotationAreas(internshipAreaId) async {
    try {
      isLoading(true);
      var response = await RotationAreasService.rotationAreas(internshipAreaId);
      if (response != null) {
        isLoading(false);
        success(true);
        data.value = response;
      } else {
        isLoading(false);
        success(true);
        data.value = RotationAreasModel();
      }
    } finally {
      isLoading(false);
    }
  }
}
