import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/home_products_controller.dart';
import 'package:prl_app/model/constant/theme.dart';

import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/view/widgets/Home/row_type_widget.dart';
import 'package:prl_app/view/widgets/Home/bottun_container_icon_widget.dart';
import 'package:prl_app/view/widgets/Home/text_filde_sesrch_widget.dart';

class HomeProductsScreen extends StatelessWidget {
  const HomeProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProductsController controller = Get.put(HomeProductsController());
    // HomeProductsController controller = Get.put(HomeProductsController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorApp.darkMain,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsetsDirectional.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottunContainerIconWidget(
                    icon: Icons.person_2_outlined,
                    onTap: () {
                     Get.toNamed( AppRoutes.profilePage);
                    },
                  ),
                  Image.asset(
                    ImageRouts.logo,
                    height: 38,
                    width: 38,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFildeSesrchWidget(
                    hintText: 'Search for Products',
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  //  BottunContainerIconWidget(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => Row(
                    children: [
                      RowTypeWidget(
                        container: controller.index.value == 0
                            ? ColorApp.mainApp
                            : ColorApp.s,
                        text: controller.index.value == 0
                            ? ColorApp.darkMain
                            : ColorApp.lightMain.withOpacity(0.70),
                        data: 'Products',
                        onTap: () => controller.goToProducts(),
                      ),
                      RowTypeWidget(
                        container: controller.index.value == 1
                            ? ColorApp.mainApp
                            : ColorApp.s,
                        text: controller.index.value == 1
                            ? ColorApp.darkMain
                            : ColorApp.lightMain.withOpacity(0.70),
                        data: 'Category',
                        onTap: () => controller.goToCategory(),
                      ),
                      RowTypeWidget(
                        container: controller.index.value == 2
                            ? ColorApp.mainApp
                            : ColorApp.s,
                        text: controller.index.value == 2
                            ? ColorApp.darkMain
                            : ColorApp.lightMain.withOpacity(0.70),
                        data: 'Stores',
                        onTap: () => controller.goToStores(),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
              Obx(() => controller.section[controller.index.value]),
              // const CartItem(),
            ],
          ),
        ),
      ),
    ));
  }
}
