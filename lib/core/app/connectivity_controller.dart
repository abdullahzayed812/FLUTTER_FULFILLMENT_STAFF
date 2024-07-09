import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityController {
  ConnectivityController._();

  // static final ConnectivityController instance= ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isInterNetConnection(result);
    Connectivity().onConnectivityChanged.listen(isInterNetConnection);
  }

    bool isInterNetConnection(ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnected.value = false;
        return false;
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        isConnected.value = true;
        return true;
      } else {
        isConnected.value = false;
        return false;
      }
    }
}
