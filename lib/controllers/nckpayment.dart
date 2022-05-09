import 'package:aya2/controllers/auth/authenticated.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/nckpayment.dart';
import 'package:get/get.dart';

class NCKPaymentController extends GetxController {
  String url = '/payment/stkPush';
  String method = "POST";
  var isLoading = false.obs;
  var success = false.obs;
  AuthenticatedUserController authenticatedUser = Get.find();

  Future makePayment(String invoiceNo, String transaction) async {
    isLoading(true);
    try {
      var response = await BaseResponse().makeApiCall(method, url,
          body: {
            "invoice_no": invoiceNo,
            "phone_no": authenticatedUser.data.value.mobileNo!,
            "transaction": transaction,
          },
          fromModel: nckPaymentFromJson);
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
