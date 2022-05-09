import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/helpers/baseresponse.dart';
import 'package:aya2/models/updateProfile.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class UpdateProfileController extends GetxController {
  String url = "/auth/update";
  String method = "POST";
  var isLoading = false.obs;
  var success = false.obs;
  var updateProfile = UpdateProfile().obs;

  Future<void> updatedProfile(
      _phoneNumber, _email, _address, profilePic) async {
    try {
      isLoading(true);

      Map<String, String> body = {
        'mobileno': _phoneNumber,
        'email': _email,
        'address': _address,
      };

      // var response = await BaseCreate().makeApiCall(method,
      //     body: {
      //       "mobileno": _phoneNumber,
      //       "email": _email,
      //       "address": _address,
      //       // http.MultipartFile.fromPath('profile_pic', profilePic.path)
      //       // "profile_pic": profilePic
      //     },
      //     fromModel: updateProfileFromJson);
      // response.files.add(
      //     await http.MultipartFile.fromPath('profile_pic', profilePic.path));

      var response = await BaseCreate().makeAPICallWithImage(
          "/auth/update", body, "profile_pic", profilePic);

      if (response != null) {
        isLoading(false);
        success(true);
        updateProfile.value = response;
        showDialogSuccess(
            "Success", "Profile Updated. See Changes in your next login");
      } else {
        isLoading(false);
        success(false);
        updateProfile.value = UpdateProfile();
        showDialogFail(
            "Failed", "Error updating your profile, please try again later.");
      }
    } finally {
      isLoading(false);
    }
  }
}
