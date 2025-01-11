import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/services/LogInService.dart';


abstract class AbsLogInController extends GetxController {
  login();
  loginToSignUp();
}

class LoginController extends AbsLogInController {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  late TextEditingController phone;
  late TextEditingController password;
  final Loginservice loginService = Loginservice();

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  login() async {
    var formLogin = formKeyLogin.currentState;
    if (formLogin!.validate()) {
      // Show loading dialog
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      bool success = await loginService.login(phone.text, password.text);

      Get.back(); // Close the loading dialog

      if (success) {
        // Show success message and navigate to homepage
        Get.snackbar(
          "Success",
          loginService.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(AppRoutes.main_home_screen);
      } else {
        // Show error message
        Get.snackbar(
          "Error",
          loginService.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  loginToSignUp() {
    Get.toNamed(AppRoutes.singup);
  }
}
