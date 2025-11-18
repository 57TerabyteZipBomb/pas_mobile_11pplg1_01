import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg1_01/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_01/widgets/widget_textfield_awesome.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page', style: TextStyle(color: Colors.white),), backgroundColor: Colors.lightBlue,),
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

            MyOtherTextField(
              textEditingController: controller.fullname,
              label: "Full Name",
            ),
            const SizedBox(height: 30),

            MyOtherTextField(
              textEditingController: controller.email,
              label: "Email",
            ),
            const SizedBox(height: 30),

            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onPressed: controller.register,
                      text: "Register",
                      cancustomwidth: true,
                      customwidth: 300,
                    ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
