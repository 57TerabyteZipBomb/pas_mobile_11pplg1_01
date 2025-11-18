import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/product_controller.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          if (controller.isLoading.value == false) {
            return RefreshIndicator(
              onRefresh: controller.fetchProducts,
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.title),
                      subtitle: Text("${product.price} | ${product.category} | ${product.rating.rate} stars (${product.rating.count} reviews)"),
                      trailing: IconButton(onPressed: controller.prodOnPress, icon: Icon(Icons.bookmark, color: const Color.fromARGB(255, 77, 77, 77),)),
                    ),
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
