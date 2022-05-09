import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/transferreasonsget.dart';
import 'package:get/get.dart';

class TransferReasonsGetController extends GetxController {
  String url = '/internship/reasons';
  String method = 'GET';
  var isLoading = false.obs;
  var data = Transferreasonsget().obs;

  @override
  void onInit() {
    getTransferReasons();
    super.onInit();
  }

  Future<void> getTransferReasons() async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, fromModel: transferreasonsgetFromJson);
    if (response != null) {
      isLoading(false);
      data.value = response;
    } else {
      isLoading(false);
      data.value = Transferreasonsget();
    }
  }
}
