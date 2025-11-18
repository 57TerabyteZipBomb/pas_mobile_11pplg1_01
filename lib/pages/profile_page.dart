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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/awesome.png'),
              ),

              SizedBox(height: 20),

              // Info Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Gerrard Yazdan Arkinara",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("11 PPLG 1, Absen 15",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("gerrard.arkinara@gmail.com",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Logout Button
              CustomButton(
                onPressed: controller.logout,
                text: "Log Out",
                cancustomwidth: true,
                customwidth: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}