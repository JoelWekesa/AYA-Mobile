// ignore_for_file: non_constant_identifier_names

import 'package:aya2/controllers/auth/login.dart';
import 'package:aya2/models/internshipapply.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class InternshipApplyService {
  static Future applyInternship(
    posting_letter,
    degree_cert,
    education_id,
    internship_center,
    start_date,
  ) async {
    LoginController controller = Get.put(LoginController());

    var headers = {'Authorization': 'Bearer ${controller.data.value.token}'};
    var request = http.MultipartRequest('POST',
        Uri.parse('https://aya-api.mhealthkenya.co.ke/api/internship/apply'));
    request.fields.addAll({
      'education_id': education_id,
      'internship_center': internship_center,
      'start_date': start_date,
      'cadre': 'BSCN'
    });
    request.files.add(await http.MultipartFile.fromPath(
        'posting_letter', posting_letter.path));
    request.files.add(
        await http.MultipartFile.fromPath('degree_cert', degree_cert.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      return internshipApplyFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
