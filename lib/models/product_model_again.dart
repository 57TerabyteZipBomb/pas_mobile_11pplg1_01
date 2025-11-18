import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg1_01/models/product_model.dart';

class ProductModelAgain {
  ProductModel product;
  bool isBookmarked;

  ProductModelAgain({
    required this.product,
    required this.isBookmarked
  });

  Map<String, dynamic> toMap() {
    return {
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'category': product.category,
      'image': product.image,
      'rate': product.rating.rate,
      'count': product.rating.count,
      'isBookmarked': isBookmarked,
    };
  }

  factory ProductModelAgain.fromMap(Map<String, dynamic> map) {
    return ProductModelAgain(
      product: map['product'],
      isBookmarked: map['isBookmarked'],
    );
  }
}