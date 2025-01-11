import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/onbording_controller.dart';
import 'package:prl_app/model/constant/onbording_static.dart';
import 'package:prl_app/model/constant/theme.dart';

class OnbordingCountWidget extends StatelessWidget {
  const OnbordingCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnbordingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onbordingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 4),
                          duration: const Duration(microseconds: 900),
                          width: 8,
                          height: 2,
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? ColorApp.mainApp
                                : ColorApp.lightMain,
                          ),
                        )),
              ],
            ));
  }
}
