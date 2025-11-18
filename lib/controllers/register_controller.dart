import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/api/clientnetwork.dart';
import 'package:pas_mobile_11pplg1_01/models/register_model.dart';

class RegisterController extends GetxController {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();

  RxBool isLoading = false.obs;

  void register() async{
    isLoading.value = true;
    try {
      final response = await ClientNetwork.postData("latihan/register-user", {
        "username": user.text,
        "password": pass.text,
        "full_name": fullname.text,
        "email": email.text,
      });

      if (response.statusCode == 200){
        final result = registerModelFromJson(response.body);

        if (result.status) {
          Get.snackbar("Success", "Register successful: ${result.message}");
          Get.back();
        } else {
          Get.snackbar("Failed", result.message);
        }
      }
    }
    catch (e){
      Get.snackbar("Error", "Exception: $e");
      print(e);
    }
    isLoading.value = false;
  }
}
