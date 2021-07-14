import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkConnectionController extends GetxController{
  var isOnline = false.obs;
  var networkStatus = "loading".obs;
  late ConnectivityResult _connectivityResult;
  late StreamSubscription<ConnectivityResult> _connectionStream;
  Connectivity _connectivity = Connectivity();

  @override
  void onInit() async{
    networkChecker();
    _connectionStream = _connectivity.onConnectivityChanged.listen(_updateNetworkStatus);
    super.onInit();
  }

  Future<dynamic> networkChecker() async{
    _connectivityResult = await _connectivity.checkConnectivity();
    return _updateNetworkStatus(_connectivityResult);
  }
  _updateNetworkStatus(ConnectivityResult result){
    switch(result){
      case ConnectivityResult.none:
        networkStatus.value = "No Internet Connection!!!";
        break;
      case ConnectivityResult.mobile:
        networkStatus.value = "You are online by mobile.";
        break;
      case ConnectivityResult.wifi:
        networkStatus.value = "You are online by wifi.";
        break;
    }
  }
}