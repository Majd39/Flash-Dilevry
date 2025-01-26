import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

class ProfileService {
  Future<Map<String, dynamic>> getUserDetails() async {
    final token = await TokenManager.getToken();
    if (token == null) {
      Get.snackbar('Error', 'You need to login');
      return {};
    }

    final response = await http.get(
      Uri.parse(Api.homeUrl + Api.getUserDetails),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Get.snackbar('Error', 'Failed to fetch user details');
      return {};
    }
  }

  Future<bool> updateUserDetails(Map<String, dynamic> data) async {
    final token = await TokenManager.getToken();
    if (token == null) {
      Get.snackbar('Error', 'You need to login');
      return false;
    }

    final response = await http.put(
      Uri.parse(Api.homeUrl + Api.getUserDetails),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Profile updated successfully');
      return true;
    } else {
      Get.snackbar('Error', 'Failed to update profile');
      return false;
    }
  }

  Future<bool> uploadProfileImage(File imageFile) async {
    final token = await TokenManager.getToken();
    if (token == null) {
      Get.snackbar('Error', 'You need to login');
      return false;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse(Api.homeUrl + Api.edit_profile_picture),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(await http.MultipartFile.fromPath(
      'profile_image',
      imageFile.path,
    ));

    final response = await request.send();
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Profile image updated successfully');
      return true;
    } else {
      Get.snackbar('Error', 'Failed to update profile image');
      return false;
    }
  }
}
