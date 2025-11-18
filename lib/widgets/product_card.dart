import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final RxBool isBookmarked;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.isBookmarked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image),
        title: Text(product.title),
        subtitle: Text(
          "${product.price} | ${product.category} | "
                  "${product.rating.rate} stars (${product.rating.count} reviews)" +
              "\n${product.description}",
        ),
        trailing: Obx(
          () => IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.bookmark,
              color: isBookmarked.value ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
