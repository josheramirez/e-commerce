import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


// Mamange the network status and provides methods to check and handle connectivity changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit(){
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  } 

  // update the connection status based on changes in connectivity and show a relevant popup for a no internet connection
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async{
    _connectionStatus.value = result[0];
    if(_connectionStatus.value == ConnectivityResult.none){
      Loaders.warningSnackBar(title: "No internet Connection");
    }
  }

  /// Check the internet connection status.
    /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result[0] == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}