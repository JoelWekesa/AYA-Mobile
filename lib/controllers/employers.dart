import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/employers.dart';
import 'package:get/get.dart';

class EmployersController extends GetxController {
  String url = "/licencing/employers";
  String method = "GET";
  var isLoading = false.obs;
  var employers = <Employers>[].obs;

  @override
  void onInit() {
    getEmployers(); 
    super.onInit();
  }

  Future<void> getEmployers() async {
    try {
      isLoading(true);
      var response = await BaseResponse()
          .makeApiCall(method, url, fromModel: employersFromJson);
      if (response != null) {
        isLoading(false);
        employers.value = response;
      } else {
        isLoading(false);
        employers.value = <Employers>[];
      }
    } finally {
      isLoading(false);
    }
  }
}
