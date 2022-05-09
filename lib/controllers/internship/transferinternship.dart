import 'package:aya2/helpers/transferinternship.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class TransferInternshipController extends GetxController {
  var isLoading = false.obs;
  var isSuccess = false.obs;

  Future<void> transferInternship(internshipId, transferReasonId,
      transferRequestDesc, transferInternshipCenter) async {
    try {
      isLoading(true);
      var response = await TransferInternshipService.transferInternship(
          internshipId,
          transferReasonId,
          transferRequestDesc,
          transferInternshipCenter);
      if (response != null) {
        isLoading(false);
        isSuccess(true);
        showDialogSuccess("Success", "Applied for internship transfer");
      } else {
        isLoading(false);
        isSuccess(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
