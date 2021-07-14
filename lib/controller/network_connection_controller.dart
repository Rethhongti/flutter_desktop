import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkConnectionController extends GetxController{
  var isOnline = false.obs;
  var networkStatus = "loading".obs;
  late ConnectivityResult _connectivityResult;

  @override
  void onInit() {
    networkChecker();
    super.onInit();
  }

  void networkChecker() async{
    _connectivityResult = await (Connectivity().checkConnectivity());
    if(_connectivityResult == ConnectivityResult.none){
      networkStatus.value = "No Internet Connection!!!";
    }else{
      networkStatus.value = "You are online.";
    }
  }
}