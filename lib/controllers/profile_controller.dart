import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  
  void logout() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    Get.offAllNamed(AppRoutes.splash);
  }
}