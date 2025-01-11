import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

class TextCardWidget extends StatelessWidget {
  const TextCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Text(
      'Perfume',
      style: TextStyle(
          color: ColorApp.lightMain,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
