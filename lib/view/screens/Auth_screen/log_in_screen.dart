import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/auth/login_controller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Aut/login/button_widget.dart';
import 'package:prl_app/view/widgets/Aut/login/text_buttonwidget.dart';
import 'package:prl_app/view/widgets/Aut/login/textfild_widget.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        body: Form(
          key: controller.formKeyLogin,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        ImageRouts.logo,
                        height: 38,
                        width: 38,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 24),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Image.asset(
                      ImageRouts.login,
                      height: 243,
                      width: 243,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.lightMain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Glad to see you again',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: ColorApp.lightMain.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                    valid: (val) =>
                        val?.isEmpty ?? true ? 'Mobile number is required' : null,
                    inputController: controller.phone,
                    data: 'Enter your number',
                    icon: Icons.call,
                    textInputType: TextInputType.phone,
                    onChanged: (val) {},
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    valid: (val) =>
                        val?.isEmpty ?? true ? 'Password is required' : null,
                    inputController: controller.password,
                    data: 'Enter your Password',
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    onChanged: (val) {},
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    data: 'Login',
                    onTap: () => controller.login(),
                  ),
                  const SizedBox(height: 16),
                  TextButtonwidget(
                    data: 'Not Have Account',
                    onTap: () => controller.loginToSignUp(),
                    text: 'Register',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
