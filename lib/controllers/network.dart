// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:aya2/screens/dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connection = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  @override
  void onInit() {
    getConnection();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(updateConnection);
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

  Future<void> getConnection() async {
    var connectionStatus;
    try {
      connectionStatus = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e);
    }

    return updateConnection(connectionStatus);
  }

  updateConnection(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connection.value = 1;
        update();
        break;

      case ConnectivityResult.mobile:
        connection.value = 1;
        update();
        break;

      case ConnectivityResult.none:
        connection.value = 0;
        update();
        break;

      default:
        showDialogFail("Error", "Cannot access the internet");
    }
  }
}
