import 'package:flutter/material.dart';

import '../../../model/constant/theme.dart';

class TextFildeSesrchWidget extends StatelessWidget {
  const TextFildeSesrchWidget({super.key, required this.hintText});
final String hintText;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      width: 295,
      child:  TextFormField(
        // validator: valid,
        style: const TextStyle(
            fontSize: 20, color: ColorApp.lightMain),
        // controller: inputController,
        cursorColor: ColorApp.mainApp,
        cursorHeight: 30,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 20, color: ColorApp.secndApp),
          prefixIcon: const Icon(
            (Icons.search_sharp),
            size: 24,
            color: ColorApp.lightMain,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          fillColor: ColorApp.s,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorApp.mainApp,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorApp.mainApp,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
