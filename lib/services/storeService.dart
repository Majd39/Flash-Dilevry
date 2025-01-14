import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:prl_app/model/Clases/stores_models.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';
class Storeservice {
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
Future<List<StoresModels>> fetchStoresByCategory(String categoryName) async {
  final url = Uri.parse("${Api.homeUrl}${Api.get_Stores_By_Category}/$categoryName/");
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
      print('Stores fetched successfully for category: $categoryName');
      return StoresModels.fromJsonList(stores);
    } else if (response.statusCode == 404) {
      final json = jsonDecode(response.body);
      throw Exception(json['message']); // Throw the error message from backend 
    } else if (response.statusCode == 401) {
        print('Unauthorized access');
      throw Exception('Unauthorized');

      
    } else {
      print('Failed to load stores. Status code: ${response.statusCode}');
      throw Exception('Failed to load stores');
    }
  } catch (e) {
    print('Error in fetching stores by category: $e');
    throw Exception('Failed to load stores by category due to an error: $e');
  }
}

}