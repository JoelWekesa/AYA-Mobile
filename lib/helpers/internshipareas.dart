import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/models/internshipareas.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class InternshipAreasService {
  static Future getAreas() async {
    LoginController login = Get.find();

    var headers = {'Authorization': 'Bearer ${login.data.value.token}'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://aya-api.mhealthkenya.co.ke/api/internship/internship_areas'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      return internshipAreasModelFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
