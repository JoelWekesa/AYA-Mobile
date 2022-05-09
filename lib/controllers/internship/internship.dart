import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/internship.dart';
import 'package:get/get.dart';

class InternshipController extends GetxController {
  String url = '/internship/centers';
  String method = 'POST';
  var isLoading = false.obs;
  var centers = InternshipCentres().obs;

  @override
  void onInit() {
    getInternshipCenters();
    super.onInit();
  }

  Future getInternshipCenters() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          body: {"cadre": "BSCN"}, fromModel: internshipCentresFromJson);
      if (response != null) {
        centers.value = response;
        isLoading(false);
      } else {
        isLoading(false);
        centers.value = InternshipCentres();
      }
    } finally {
      isLoading(false);
    }
  }
}
