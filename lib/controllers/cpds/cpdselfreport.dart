import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/models/cpdselfreport.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';

class CpdSelfReportController extends GetxController {
  String url = "/CPD/selfreport";
  String method = "POST";
  var isLoading = false.obs;
  var selfreport = CpdSelfReport().obs;
  AuthenticatedUserController controller =
      Get.put(AuthenticatedUserController());

  Future<void> cpdSelfReport(
      category, eventDate, eventTitle, eventLocation, cpdEvidence) async {
    isLoading(true);
    var response = await BaseCreate().makeApiCall(
      url,
      body: {
        'index_id': controller.data.value.id!,
        'category_id': category,
        'event_date': eventDate,
        'event_title': eventTitle,
        'event_location': eventLocation,
        // 'cpd_evidence': cpdEvidence,
      },
      fromModel: cpdSelfReportFromJson,
    );

    if (response != null) {
      showDialogSuccess("Success", "CPD self Reporting Done");
      selfreport.value = response;
      isLoading(false);
    } else {
      selfreport.value = CpdSelfReport();
      isLoading(false);
    }
  }
}
