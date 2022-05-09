// import 'package:get/get.dart';

// class MPESAController extends GetxController {
//   var isLoading = false.obs;
//   var success = false.obs;

//   Future<void> makePayment(id) async {
//     try {
//       isLoading(true);
//       var response = await MPESAPayService.processPayment(id);
//       if (response != null) {
//         isLoading(false);
//         success(true);
//         Get.back();
//       } else {
//         isLoading(false);
//         success(false);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
