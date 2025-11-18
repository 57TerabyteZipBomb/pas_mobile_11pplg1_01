import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/product_controller.dart';
import 'package:pas_mobile_11pplg1_01/widgets/product_card.dart';

class BookmarksPage extends StatelessWidget {
  BookmarksPage({super.key});

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmarks")),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return Center(child: Text("No bookmarks yet"));
        }

        return ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (_, index) {
            final bookmarked = controller.bookmarks[index].product;

            return ProductCard(
              product: bookmarked,
              isBookmarked: true.obs,
              onTap: () => controller.toggleBookmark(bookmarked),
            );
          },
        );
      }),
    );
  }
}