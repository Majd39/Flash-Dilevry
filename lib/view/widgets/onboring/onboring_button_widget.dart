import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/onbording_controller.dart';
import 'package:prl_app/model/constant/theme.dart';

class OnboringButtonWidget extends GetView<OnbordingController> {
  const OnboringButtonWidget({super.key, required this.data});
  // final Widget nextStep;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.mainApp,
      ),
      height: 26,
      width: 44,
      child: TextButton(
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsetsDirectional.all(0),
            ),
          ),
          onPressed: () {
            if (data == 'next') {
              controller.next();
            } else if (data == 'pre') {
              controller.pre();
            } else if (data == 'skip') {
              controller.skip();
            }
          },
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )),
    );
  }
}
