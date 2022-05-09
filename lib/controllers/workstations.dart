import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/workstations.dart';
import 'package:get/get.dart';

class WorkStationsController extends GetxController {
  String url = "/licencing/workstations";
  String method = "GET";
  var isLoading = false.obs;
  var workstations = <WorkStations>[].obs;

  @override
  void onInit() {
    getWorkStations();
    super.onInit();
  }

  Future<void> getWorkStations() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: workStationsFromJson);
      if (response != null) {
        isLoading(false);
        workstations.value = response;
      } else {
        isLoading(false);
        workstations.value = <WorkStations>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
