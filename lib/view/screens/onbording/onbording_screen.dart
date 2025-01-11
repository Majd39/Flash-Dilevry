import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/onbording_controller.dart';
import 'package:prl_app/view/widgets/onboring/onbording_count_widget.dart';
import 'package:prl_app/view/widgets/onboring/onbording_slider_widget.dart';
import 'package:prl_app/view/widgets/onboring/onboring_button_widget.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnbordingController());
    return Scaffold(
      backgroundColor: const Color(0xff0D0D0D),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OnboringButtonWidget(
                    data: 'skip',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 6,
                child: OnbordingSliderWidget(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    OnbordingCountWidget(),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboringButtonWidget(
                          data: 'pre',
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        OnboringButtonWidget(
                          data: 'next',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
