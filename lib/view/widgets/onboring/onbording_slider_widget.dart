import 'package:flutter/material.dart';
import 'package:prl_app/controlar/controllers/onbording_controller.dart';
import 'package:prl_app/model/constant/onbording_static.dart';
import 'package:get/get.dart';

class OnbordingSliderWidget extends GetView<OnbordingController> {
  const OnbordingSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onChanged(value);
      },
      itemCount: onbordingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            height: 373,
            width: 342,
            child: Image.asset(onbordingList[index].imageUrl!),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            onbordingList[index].title!,
            style: const TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            onbordingList[index].body!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff555555),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 56,
          ),
        ],
      ),
    );
  }
}
