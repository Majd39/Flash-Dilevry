import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

class BottunContainerIconWidget extends StatelessWidget {
  const BottunContainerIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Container(
        margin: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.mainApp,
        ),
        height: 40,
        width: 40,
        child: const Icon(
          Icons.person_outline_rounded,
          size: 36,
        ),
      ),
    );
  }
}
