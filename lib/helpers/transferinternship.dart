import 'dart:convert';

import 'package:aya2/helpers/baseurl.dart';
import 'package:aya2/models/transferinternship.dart';
import 'package:aya2/screens/dialog.dart';
import "package:http/http.dart" as http;

class TransferInternshipService {
  static Future transferInternship(internshipId, transferReasonId,
      transferRequestDesc, transferInternshipCenter) async {
    var url = BaseURL();
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('${url()}/internship/transfer_request'));
    request.body = json.encode({
      "internship_id": internshipId,
      "transfer_reason_id": transferReasonId,
      "transfer_request_desc": transferRequestDesc,
      "transfer_internship_center": transferInternshipCenter
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      return transferInternshipFromJson(jsonString);
    } else {
      String jsonString = await response.stream.bytesToString();
      showDialogFail("Error", jsonString);
      return null;
    }
  }
}
