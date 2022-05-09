import 'dart:convert';

import 'package:aya2/models/approvecompetencies.dart';
import 'package:aya2/screens/dialog.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';

class ApproveCompetenciesService {
  static Future approveCompetencies(String internshipId, String competencyId,
      String approverName, String approverId, String approverNo) async {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('POST',
        Uri.parse('https://aya-api.mhealthkenya.co.ke/api/internship/approve'));
    request.body = json.encode({
      "internship_id": internshipId,
      "competency_id": competencyId,
      "approval_date": formatter.format(now),
      "approver_name": approverName,
      "approver_id_number": approverId,
      "approver_phone_no": approverNo,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      showDialogSuccess("Success", "Competency Approved");
      return approveCompetenciesModelFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
