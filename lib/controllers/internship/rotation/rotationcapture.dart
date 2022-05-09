import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/rotationcapture.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class RotationCaptureController extends GetxController {
  String url = '/internship/rotation_activities/capture';
  String method = 'POST';
  var isLoading = false.obs;
  var success = false.obs;

  Future<void> rotationCapture(
    internshipId,
    competencyId,
    activityNotes,
    activityDate,
  ) async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          body: {
            "internship_id": internshipId,
            "competency_id": competencyId,
            "activity_notes": activityNotes,
            "activity_date": activityDate
          },
          fromModel: rotationCaptureFromJson);
      // RotationCaptureService.rotationCapture(
      //     internshipId, competencyId, activityNotes, activityDate);
      if (response != null) {
        isLoading(false);
        success(true);
        showDialogSuccess("Success", "Rotation Competency added");
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
