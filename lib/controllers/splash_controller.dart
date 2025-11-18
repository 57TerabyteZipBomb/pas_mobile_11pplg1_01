import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';

class SplashController extends GetxController{
  
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin()async{
    final prefs = await SharedPreferences.getInstance();
    final savedtoken = prefs.getString('token');
    await Future.delayed(Duration(seconds: 3));
    if (savedtoken != null && savedtoken.isNotEmpty) {
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}