import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/auth/sin_up_controller.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/view/widgets/Aut/login/button_widget.dart';
import 'package:prl_app/view/widgets/Aut/login/text_buttonwidget.dart';
import 'package:prl_app/view/widgets/Aut/login/textfild_widget.dart';

class SingUp extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          const Text(
            'Welcome',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Image.asset("assets/images/Delivery logo.png"),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    children: [
                      _buildTextFields(),
                      const SizedBox(height: 20),
                      ButtonWidget(
                        data: 'REGISTER',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.upsign();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButtonwidget(
                        data: 'Already have an account?',
                        text: 'LOGIN',
                        onTap: () => Get.toNamed(AppRoutes.login),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        TextFieldWidget(
          data: 'First name',
          icon: Icons.person,
          textInputType: TextInputType.name,
          valid: (value) => value?.isEmpty ?? true ? 'First name is required' : null,
          onChanged: (value) => controller.firstName = value,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          data: 'Last name',
          icon: Icons.person,
          textInputType: TextInputType.name,
          valid: (value) => value?.isEmpty ?? true ? 'Last name is required' : null,
          onChanged: (value) => controller.lastName = value,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          data: 'Enter your number',
          icon: Icons.phone,
          textInputType: TextInputType.phone,
          valid: (value) {
            if (value == null || value.isEmpty) {
              return 'Mobile number is required';
            }
            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
              return 'Enter a valid 10-digit mobile number';
            }
            return null;
          },
          onChanged: (value) => controller.mobile = value,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          data: 'Enter your Password',
          icon: Icons.lock,
          textInputType: TextInputType.visiblePassword,
          valid: (value) {
            if (value == null || value.isEmpty) return 'Password is required';
            if (value.length < 8) return 'Password must be at least 8 characters';
            if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(value)) {
              return 'Password must contain letters and numbers';
            }
            return null;
          },
          onChanged: (value) => controller.password = value,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          data: 'Confirm your Password',
          icon: Icons.lock,
          textInputType: TextInputType.visiblePassword,
          valid: (value) {
            if (value == null || value.isEmpty) return 'Confirm password is required';
            if (value != controller.password) return 'Passwords do not match';
            return null;
          },
          onChanged: (value) => controller.password_confirmation = value,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          data: 'Enter your location',
          icon: Icons.home,
          textInputType: TextInputType.streetAddress,
          valid: (value) => value?.isEmpty ?? true ? 'Address is required' : null,
          onChanged: (value) => controller.address = value,
        ),
      ],
    );
  }
}
