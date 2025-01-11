import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/model/Clases/stores_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class Homepageservice {
  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse(Api.homeUrl + Api.getCategory);
    try {
      // Fetch the token from shared preferences
      final token = await TokenManager.getToken();
      
      // If no token is found, you might want to handle that (e.g., redirect to login)
      if (token == null || token.isEmpty) {
        throw Exception('No access token found');
      }

      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',  // Include the token in the Authorization header
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final categories = json['categories'] as List<dynamic>;
        print('Categories fetched successfully');
        return Category.fromJsonList(categories);
      } else if (response.statusCode == 401) {
        final json = jsonDecode(response.body);
        print('Unauthorized access: ${json["message"]}');
        throw Exception('Unauthorized: ${json["message"]}');
      } else {
        print('Failed to load categories. Status code: ${response.statusCode}');
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error in fetching categories: $e');
      throw Exception('Failed to load categories due to an error: $e');
    }

  }
  Future<List<StoresModels>> fetchStores() async {
  final url = Uri.parse(Api.homeUrl + Api.getStors);
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
      final stores = json['stores'] as List<dynamic>;
      print('Stores fetched successfully');
      return StoresModels.fromJsonList(stores);
    } else if (response.statusCode == 401) {
      print('Unauthorized access');
      throw Exception('Unauthorized');
    } else {
      print('Failed to load stores. Status code: ${response.statusCode}');
      throw Exception('Failed to load stores');
    }
  } catch (e) {
    print('Error in fetching stores: $e');
    throw Exception('Failed to load stores due to an error: $e');
  }
}

}
