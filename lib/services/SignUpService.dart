import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/Clases/User.dart';
import 'package:prl_app/model/data/Api.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class Signupservice {
  final Uri url = Uri.parse(Api.homeUrl + Api.signUpUrl);
  String message = "";

  Future<bool> signup(User user) async {
    try {
      // Debug log for request
      print('Starting signup request with URL: $url');
      print('Request body: ${user.toJson()}');

      var response = await http
          .post(
            url,
            body: user.toJson(),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${await TokenManager.getToken()}',
            },
          )
          .timeout(const Duration(seconds: 30)); // Set timeout to 30 seconds

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.body);
        await TokenManager.saveToken(jsonResponse['access_token']);
        message = jsonResponse['message'];
        return true;
      } else if (response.statusCode == 422) {
        var errorData = json.decode(response.body);
        message = errorData['errors'] != null
            ? (errorData['errors'] as Map<String, dynamic>)
                .values
                .map((e) => e.join(', '))
                .join('\n')
            : errorData['message'];
      } else {
        message = "An unknown error occurred.";
      }
    } on TimeoutException {
      message = 'Request timed out. Please try again.';
    } on SocketException {
      message = 'No internet connection. Please check your network.';
    } catch (e) {
      message = 'An unexpected error occurred: $e';
    }
    return false;
  }
}
