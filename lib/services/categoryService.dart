import 'dart:convert';
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse(Api.homeUrl + Api.getCategory);
    try {
      // Fetch the token from shared preferences
      final token = await TokenManager.getToken();

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

        // Print and return success message
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
}
