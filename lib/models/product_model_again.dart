import 'package:pas_mobile_11pplg1_01/models/product_model.dart';

class ProductModelAgain {
  ProductModel product;
  bool isBookmarked;

  ProductModelAgain({
    required this.product,
    required this.isBookmarked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'category': categoryValues.reverse[product.category],
      'image': product.image,
      'rate': product.rating.rate,
      'count': product.rating.count,
      'isBookmarked': isBookmarked ? 1 : 0,
    };
  }

  factory ProductModelAgain.fromMap(Map<String, dynamic> map) {
    return ProductModelAgain(
      product: ProductModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        description: map['description'],
        category: categoryValues.map[map['category']]!,
        image: map['image'],
        rating: Rating(
          rate: map['rate'],
          count: map['count'],
        ),
      ),
      isBookmarked: map['isBookmarked'] == 1,
    );
  }
}