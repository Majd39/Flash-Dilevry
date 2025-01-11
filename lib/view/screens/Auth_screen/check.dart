import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/auth/check_contrller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Aut/check/check_button_widget.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckContrller());

    return Scaffold(
      backgroundColor: ColorApp.darkMain,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Center(
                  child: Image.asset(ImageRouts.logo),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: ColorApp.mainApp,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(h)
                  const TextWidget(
                    data: 'Hello',
                    color: ColorApp.lightMain,
                    fontWeight: FontWeight.bold,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextWidget(
                    data: 'Do you have an account ?  ',
                    color: ColorApp.lightMain,
                    fontWeight: FontWeight.bold,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckButtonWidget(
                        data: 'YES',
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      CheckButtonWidget(data: 'NO'),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const TextWidget(
                      data: 'Welcome to our application',
                      color: ColorApp.lightMain,
                      fontWeight: FontWeight.w400,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
