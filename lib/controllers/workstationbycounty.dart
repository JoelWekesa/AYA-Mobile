import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/workstationbycounty.dart';
import 'package:get/get.dart';

class WorkStationbyCountyController extends GetxController {
  String method = "GET";
  var isLoading = false.obs;
  var workstations = <WorkstationByCounty>[].obs;

  // @override
  // void onInit() {
  //   getWorkStationsbycounty();
  //   super.onInit();
  // }

  Future<void> getWorkStationsbycounty(String? id) async {
    String url = "/workstations?county_id=$id";

    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: workstationByCountyFromJson);
      if (response != null) {
        isLoading(false);
        workstations.value = response;
      } else {
        isLoading(false);
        workstations.value = <WorkstationByCounty>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
