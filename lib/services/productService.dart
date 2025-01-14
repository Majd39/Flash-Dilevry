import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';
class Productservice {
  Future<List<ProductsModels>> fetchProducts() async {
    final url = Uri.parse(Api.homeUrl + Api.getProduct);
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
        print(response.body);
        final stores = json['stores'] as List<dynamic>;
        final products = ProductsModels.fromJsonList(stores);
        for (var product in products) {
          print('Product ID: ${product.product_id}'); // Debugging the product ID
        }
        return products;
      } else {
        throw Exception('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
