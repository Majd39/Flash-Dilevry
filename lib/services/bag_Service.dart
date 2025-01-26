// ignore: file_names
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class BagService {
  var url = Uri.parse(Api.homeUrl + Api.get_Cart_Summary);
Future<bool> addToCart(String productId, int quantity) async {
  final token = await TokenManager.getToken();
  if (token == null) {
    Get.snackbar('Error', 'You need to login to add items to the cart');
    return false;
  }

  try {
    final response = await http.post(
      Uri.parse('${Api.homeUrl}${Api.addToCart}/$productId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept':'application/json'
      },
      body: jsonEncode({'quantity_item': quantity}),
    );


    if (response.statusCode == 200) {
      return true;
    } else {
      final responseBody = jsonDecode(response.body);
      final errorMessage = responseBody['message'] ?? 'Unknown error';
      Get.snackbar('Error', errorMessage);
    }
  } catch (e) {
    Get.snackbar('Error', 'An unexpected error occurred.');
  }

  return false;
}


  Future<Map<String, dynamic>> getCartSummary() async {
    try {
      final token = await TokenManager.getToken();
      if (token == null) {
        Get.snackbar('Error', 'You need to log in to access the cart');
        return {};
      }
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Get.snackbar('Error', 'Unable to fetch cart summary');

        return {};
      }
    } catch (e) {
      throw Exception('Failed to fetch cart summary');
    }
  }
}
