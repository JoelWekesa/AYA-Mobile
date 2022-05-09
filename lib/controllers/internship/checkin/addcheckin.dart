import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/checkinadd.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class AddCheckinController extends GetxController {
  String url = '/checkin/';
  String method = 'POST';
  var isLoading = false.obs;
  var success = false.obs;

  Future addCheckin(internshipId, checkinDate, nurseOfficerIncharge,
      nurseOfficerInchargeMobile, supervisor, supervisorMobile) async {
    try {
      isLoading(true);

      var response = await BaseResponse().makeApiCall(method, url,
          body: {
            "internship_id": internshipId,
            "checkin_date": checkinDate,
            "nurse_officer_incharge": nurseOfficerIncharge,
            "nurse_officer_incharge_mobile": nurseOfficerInchargeMobile,
            "supervisor": supervisor,
            "supervisor_mobile": supervisorMobile
          },
          fromModel: checkInAddModelFromJson);
      // AddCheckingService.addCheckin(
      //     internshipId,
      //     checkinDate,
      //     nurseOfficerIncharge,
      //     nurseOfficerInchargeMobile,
      //     supervisor,
      //     supervisorMobile);

      if (response != null) {
        isLoading(false);
        success(true);
        Get.back();
        showDialogSuccess("Success", "Checkin Added");
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
