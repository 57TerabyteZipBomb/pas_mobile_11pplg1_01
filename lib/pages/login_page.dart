import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_01/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_01/widgets/widget_textfield_awesome.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page', style: TextStyle(color: Colors.white),), backgroundColor: Colors.lightBlue,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            MyOtherTextField(
              textEditingController: controller.user,
              label: "Username",
            ),
            const SizedBox(height: 20),

            MyOtherTextField(
              textEditingController: controller.pass,
              label: "Password",
              isObscured: true,
            ),
            const SizedBox(height: 30),

            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onPressed: controller.login,
                      text: "Login",
                      cancustomwidth: true,
                      customwidth: 300,
                    ),
            ),
            const SizedBox(height: 30),

            CustomButton(
              onPressed: controller.goToRegister,
              text: "Create New Account",
              cancustomwidth: true,
              customwidth: 300,
            ),
          ],
        ),
      ),
    );
  }
}
