import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg1_01/widgets/widget_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomButton(
              onPressed: controller.logout,
              text: "Log Out",
              cancustomwidth: true,
              customwidth: 300,
            ),
          ],
        ),
      ),
    );
  }
}