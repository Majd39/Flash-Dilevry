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
    try {print("i am starting request at ${Api.homeUrl+Api.loginUrl}");
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
        var jsonResponse = json.decode(response.body);
        await TokenManager.saveToken(jsonResponse['access_token']);
        message = "Login successful!";
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 422) {
        var jsonResponse = json.decode(response.body);
        message = jsonResponse['message'] ?? "Invalid credentials.";
              print(response.statusCode);
      print("i recived respons and the respons is :${response.body+message}");
      print(message);
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
