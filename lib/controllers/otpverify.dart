import 'package:aya2/helpers/otpverify.dart';
import 'package:get/get.dart';

class OTPVerifyController extends GetxController {
  var isLoading = false.obs;
  var success = false.obs;

  Future<void> otpService(String mobileNo, String otp) async {
    try {
      isLoading(true);
      var response = await OtpGetVerifyService.getOTP(mobileNo, otp);
      if (response != null) {
        isLoading(false);
        success(true);
      } else {
        isLoading(false);
        success(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
