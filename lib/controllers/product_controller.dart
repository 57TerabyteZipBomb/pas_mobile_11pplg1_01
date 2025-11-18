import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_01/models/product_model.dart';

class ProductController extends GetxController{

  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async{
    const url = "https://fakestoreapi.com/products";
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      //bugger
      print("status code: " + response.statusCode.toString());
      print("json result: " + response.body.toString());

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List thingy = data;
        products.assignAll(thingy.map((e) => ProductModel.fromJson(e)).toList());
      } else {
        Get.snackbar("error", "idk bro", backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    }
    catch (e){
      Get.snackbar("error", e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
    isLoading.value = false;
  }

  void prodOnPress(){
    //amg
  }
}