import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_01/controllers/product_controller.dart';
import 'package:pas_mobile_11pplg1_01/controllers/profile_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}