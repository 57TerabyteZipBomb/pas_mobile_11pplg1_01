import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/api/clientnetwork.dart';
import 'package:pas_mobile_11pplg1_01/models/login_model.dart';
import 'package:pas_mobile_11pplg1_01/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  
  RxBool isLoading = false.obs;

  void login() async{
    isLoading.value = true;
    try {
      final response = await ClientNetwork.postData("latihan/login", {
        "username": user.text,
        "password": pass.text,
      });

      if (response.statusCode == 200) {
        final result = loginModelFromJson(response.body);

        if (result.status) {
          Get.snackbar("Success", "${result.message}");
          print("Token: ${result.token}");

          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", result.token.toString());
          Get.offAllNamed(AppRoutes.main);
        } else {
          Get.snackbar("Failed", result.message);
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
        print(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Error", "Exception: $e");
      print(e);
    }
    isLoading.value = false;
  }

  void goToRegister() async{
    Get.toNamed(AppRoutes.register);
  }
}