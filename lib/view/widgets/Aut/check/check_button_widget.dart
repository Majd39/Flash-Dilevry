import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/auth/check_contrller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CheckButtonWidget extends GetView<CheckContrller> {
  const CheckButtonWidget({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return data == 'YES'
        ? InkWell(
            splashColor: ColorApp.darkMain.withOpacity(0.1),
            onTap: () {
              controller.goToLogin();
            },
            child: Container(
              width: 163,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorApp.darkMain,
              ),
              child: const Center(
                  child: TextWidget(
                      data: 'YES',
                      color: ColorApp.mainApp,
                      fontWeight: FontWeight.w400,
                      size: 20)
                  ),
            ),
          )
        : InkWell(
            splashColor: ColorApp.darkMain.withOpacity(0.1),
            onTap: () {
              controller.goToSingup();
            },
            child: Container(
              width: 163,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0XffFF8901),
                border: Border.all(
                  width: 3,
                  color: const Color(0xFF0D0D0D),
                ),
              ),
              child: const Center(
                  child: TextWidget(
                      data: 'NO',
                      color: ColorApp.darkMain,
                      fontWeight: FontWeight.w400,
                      size: 20)),
            ),
          );
  }
}
