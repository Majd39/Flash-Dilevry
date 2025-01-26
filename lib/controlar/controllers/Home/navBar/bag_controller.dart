import 'dart:convert';

import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';
import 'package:prl_app/services/bag_Service.dart';
import 'package:http/http.dart' as http;
class BagController extends GetxController {
  final BagService bagService = BagService();

  var cartProducts = <String>{}.obs;
  var cartItems = <ProductsModels>[].obs;
  var totalPrice = 0.0.obs;
  var totalItems = 0.obs;

  Future<void> addToCart(String productId, int quantity) async {
    if (cartProducts.contains(productId)) {
      Get.snackbar('Info', 'Product is already in cart');
    } else {
      final success = await bagService.addToCart(productId, quantity);
      if (success) {
        cartProducts.add(productId);
        Get.snackbar('Success', 'Added to cart');
      }
    }
  }

  void fetchCartSummary() async {
    try {
      final data = await bagService.getCartSummary();

      // Safely parse data and update state
      totalPrice.value = (data['total_price'] ?? 0.0).toDouble();
      totalItems.value = int.tryParse(data['total_items']?.toString() ?? '0') ?? 0;

      final items = data['items'] != null ? data['items'] as List<dynamic> : [];
      cartItems.value = items.map((item) {
        final productData = item['product'] ?? {};
        return ProductsModels.fromJson({
          ...productData,
          'quantity_item': item['quantity_item'] ?? 1,
        });
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch cart summary: $e');
    }
  }
  Future<bool> updateCartQuantity(String productId, int quantity) async {
  final token = await TokenManager.getToken();
  if (token == null) {
    Get.snackbar('Error', 'You need to login to update cart items');
    return false;
  }

  try {
    final response = await http.put(
      Uri.parse('${Api.homeUrl}${Api.updateCartQuantity}/$productId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'quantity_item': quantity}),
    );

    if (response.statusCode == 200) {
      print('Cart quantity updated successfully');
      return true;
    } else {
      print('Error updating quantity: ${response.body}');
      Get.snackbar('Error', 'Failed to update cart quantity');
    }
  } catch (e) {
    print('Exception updating cart quantity: $e');
    Get.snackbar('Error', 'An unexpected error occurred.');
  }

  return false;
}

}
