import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/models/competency.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class CompetencySummaryService {
  static Future getCompetencies(
      String internshipId, String intershipRotationId) async {
    LoginController login = Get.find();
    var headers = {
      'Authorization': 'Bearer ${login.data.value.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://aya-api.mhealthkenya.co.ke/api/internship/rotation-activities/summary?internship_id=$internshipId&internship_rotation_id=$intershipRotationId'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return (competencySummaryModelFromJson(jsonString));
    } else {
      var jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
