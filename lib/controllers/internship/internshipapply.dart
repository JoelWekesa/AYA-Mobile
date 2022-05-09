// ignore_for_file: non_constant_identifier_names

import 'package:aya2/helpers/internshipapply.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class InternshipApplyController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;

  Future<void> applyInternship(
    posting_letter,
    degree_cert,
    education_id,
    internship_center,
    start_date,
  ) async {
    try {
      isLoading(true);
      var response = await InternshipApplyService.applyInternship(
          posting_letter,
          degree_cert,
          education_id,
          internship_center,
          start_date);

      if (response != null) {
        isLoading(false);
        success(true);
        showDialogSuccess("Success", "Internship Application was successfull");
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
