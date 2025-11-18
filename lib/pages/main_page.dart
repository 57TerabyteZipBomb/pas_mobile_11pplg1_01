import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/navigation_controller.dart';
import 'package:pas_mobile_11pplg1_01/pages/bookmarks_page.dart';
import 'package:pas_mobile_11pplg1_01/pages/products_page.dart';
import 'package:pas_mobile_11pplg1_01/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [ProductsPage(), BookmarksPage(), ProfilePage()];

  final List<String> pagenames = ["Products", "Bookmarks", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            pagenames[navController.currentIndex.value],
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.lightBlue,
        ),

        body: pages[navController.currentIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          type: BottomNavigationBarType.fixed,
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(color: Colors.white10),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
