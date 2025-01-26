// ignore: file_names
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/data/Api.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class Loginservice {
  final Uri url = Uri.parse(Api.homeUrl + Api.loginUrl);
  String message = "";

  Future<bool> login(String mobile, String password) async {
    try {
      var response = await http
          .post(
            url,
            body: {
              'mobile': mobile,
              'password': password,
            },
            headers: {
              'Accept': 'application/json',
            },
          )
          ;

      if (response.statusCode == 200) {
        json.decode(response.body);
        await TokenManager.clearToken();
        message = "Login successful!";
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 422) {
        var jsonResponse = json.decode(response.body);
        message = jsonResponse['message'] ?? "Invalid credentials.";
      } else {
        message = "An unknown error occurred.";
      }

    } on TimeoutException {
      message = "Request timed out. Please try again.";
    } on SocketException {
      message = "No internet connection. Please check your network.";
    } catch (e) {
      message = "An unexpected error occurred: $e";
    }
    return false;
  }
Future<bool> logout() async {
  try {
    final Uri logoutUrl = Uri.parse(Api.homeUrl + Api.logout);

    // Retrieve and check if the token exists
    final token = await TokenManager.getToken();
    if (token == null || token.isEmpty) {
      message = "No user token available. Please login first.";
      return false;
    }


    // Make the logout request with the token in the headers
    var response = await http.post(
      logoutUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include the token
      },
    );

    if (response.statusCode == 200) {
      message = "Logout successful!";
      await TokenManager.clearToken(); // Clear the token after successful logout
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 422) {
      var jsonResponse = json.decode(response.body);
      message = jsonResponse['message'] ?? "Invalid credentials.";
    } else {
      message = "An unknown error occurred.";
    }
  } on TimeoutException {
    message = "Request timed out. Please try again.";
  } on SocketException {
    message = "No internet connection. Please check your network.";
  } catch (e) {
    message = "An unexpected error occurred: $e";
  }
  return false;
}

}
