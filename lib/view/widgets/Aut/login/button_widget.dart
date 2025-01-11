import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.data,
    required this.onTap,
  });
  final String data;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorApp.darkMain.withOpacity(0.1),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0XffFF8901),
          border: Border.all(
            width: 3,
            color: const Color(0xFF0D0D0D),
          ),
        ),
        child: Center(
          child: Text(
            data,
            style: const TextStyle(
                color: ColorApp.darkMain,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
