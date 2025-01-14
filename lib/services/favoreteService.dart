import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class FavoriteService {
   Future<bool> addToFavorites(String productId) async {
    final token = await TokenManager.getToken();
    if (token == null) {
      Get.snackbar('Error', 'You need to login to add favorites');
      return false;
    }

    final response = await http.post(
      Uri.parse('${Api.homeUrl}${Api.add_To_Favorites}/$productId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      Get.snackbar('Info', 'Product is already in favorites');
    } else {
      Get.snackbar('Error', 'Failed to add to favorites');
    }
    return false;
  }
    Future<List<String>> getFavorites() async {
    final token = await TokenManager.getToken();
    if (token == null) {
      Get.snackbar('Error', 'You need to login to view favorites');
      return [];
    }

    final response = await http.get(
      Uri.parse('${Api.homeUrl}${Api.get_To_Favorites}'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final favorites = json['favorites'] as List<dynamic>;
      // Extract product IDs
      return favorites.map((fav) => fav['product_id'].toString()).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch favorites');
      return [];
    }
  }
  Future<ProductsModels> fetchProductById(String productId) async {
  final url = Uri.parse('${Api.homeUrl}${Api.getProduct}/$productId');
  try {
    final token = await TokenManager.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('No access token found');
    }

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return ProductsModels.fromJson(json);
    } else {
      throw Exception('Failed to fetch product. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch product: $e');
  }
}

  }

