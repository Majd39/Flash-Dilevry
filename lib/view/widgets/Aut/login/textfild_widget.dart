import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    super.key,
    required this.data,
    required this.icon,
    required this.textInputType,
     this.inputController,
    required this.valid,
    required this.onChanged,
  });

  final String? Function(String?)? valid;
  final String data;
  final IconData icon;
  final TextInputType textInputType;
   TextEditingController? inputController;
void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      style: const TextStyle(fontSize: 20, color: ColorApp.lightMain),
      onChanged: onChanged,
      controller: inputController,
      cursorColor: ColorApp.mainApp,
      cursorHeight: 30,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: data,
        hintStyle: const TextStyle(fontSize: 20, color: ColorApp.secndApp),
        prefixIcon: Icon(
          icon,
          size: 24,
          color: ColorApp.secndApp,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorApp.mainApp, // Default border color
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorApp.mainApp, // Border color when not focused
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorApp.mainApp, // Border color when focused
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
