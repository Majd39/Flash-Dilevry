import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/services/SignUpService.dart';
import 'package:prl_app/model/Clases/User.dart';

class SignUpController extends GetxController {
  String firstName = "";
  String lastName = "";
  String mobile = "";
  String password = "";
  // ignore: non_constant_identifier_names
  String password_confirmation = "";
  String address = "";

  final Signupservice signupService = Signupservice();

  Future<void> upsign() async {
    print("i am at the controller");

    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // Create User object
    User user = User(
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      address: address,
      password: password,
      password_confirmation: password_confirmation,
    );

    // Call signup service
    bool success = await signupService.signup(user);

    Get.back(); // Close the loading dialog

    if (success) {
      // Show success message
      Get.snackbar(
        'Success',
        signupService.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.toNamed(AppRoutes.main_home_screen); // Navigate to homepage
    } else {
      // Show error message
      Get.snackbar(
        'Error',
        signupService.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(signupService.message);
    }
  }
}
