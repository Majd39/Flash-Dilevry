import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/constant/theme.dart';

class BottunContainerIconWidget extends StatelessWidget {
  BottunContainerIconWidget({super.key, required this.onTap,this.icon});
  void Function() onTap;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.mainApp,
        ),
        height: 40,
        width: 40,
        child:  Icon(
          icon,
           size: 36,
        ),
      ),
    );
  }
}
