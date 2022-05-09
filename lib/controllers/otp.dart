import 'package:aya2/helpers/otp.dart';
import 'package:aya2/models/otp.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;
  var data = OtpModel().obs;

  Future<void> otpService(String mobileNo, String task, String? otp) async {
    try {
      isLoading(true);
      var response = await OtpGetService.getOTP(mobileNo, task, otp ?? "");
      if (response != null) {
        isLoading(false);
        success(true);
        data.value = response;
      } else {
        isLoading(false);
        success(false);
        data.value = OtpModel();
      }
    } finally {
      isLoading(false);
    }
  }
}
