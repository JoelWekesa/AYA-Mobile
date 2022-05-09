import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/licenceapply.dart';

class LicenceApplyController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;

  String url = "/licencing";
  String method = "POST";

  AuthenticatedUserController controller =
      Get.put(AuthenticatedUserController());

  Future<void> applyForLicence(String workstationId, String employerId,
      String countyId, String workstationName) async {
    // try {
    isLoading(true);

    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    Map<String, String> body = {
      "index_id": controller.data.value.id!,
      "renewal_Date": formatter.format(DateTime.now()),
      "workstation_id": workstationId,
      "employer_id": employerId,
      "county_id": countyId,
      "workstation_name": workstationName
    };

    var response = await BaseCreate().makeApiCall(url,
        body: body,
        fromModel: licenceApplyFromJson,
        indexId: controller.data.value.id);

    if (response != null) {
      isLoading(false);
      success(true);
      showDialogSuccess("Success", "Licence Application Successfull");
      Get.offAndToNamed("/licence_screen");
      // print(data);
    } else {
      isLoading(false);
      // print(data.value.message?.workstationName);
    }
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
