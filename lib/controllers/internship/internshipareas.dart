import 'package:aya2/helpers/internshipareas.dart';
import 'package:aya2/models/internshipareas.dart';
import 'package:get/get.dart';

class InternshipAreasController extends GetxController {
  var isLoading = false.obs;
  var areas = <InternshipAreasModel>[].obs;

  @override
  void onInit() {
    getAreas();
    super.onInit();
  }

  Future getAreas() async {
    try {
      isLoading(true);
      var response = await InternshipAreasService.getAreas();
      if (response != null) {
        isLoading(false);
        areas.value = response;
      } else {
        isLoading(false);
        areas.value = <InternshipAreasModel>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
