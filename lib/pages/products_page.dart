import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/product_controller.dart';
import 'package:pas_mobile_11pplg1_01/widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          if (!controller.isLoading.value) {
            return RefreshIndicator(
              onRefresh: controller.fetchProducts,
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (_, index) {
                  final product = controller.products[index];
                  final isBookmarked = controller.bookmarks
                      .any((b) => b.product.id == product.id)
                      .obs;
                  return ProductCard(
                    product: product,
                    isBookmarked: isBookmarked,
                    onTap: () {
                      controller.toggleBookmark(product);
                      isBookmarked.value =
                          !isBookmarked.value; // instantly update UI
                    },
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
