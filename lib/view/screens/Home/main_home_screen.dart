import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/home_products_controller.dart';
import 'package:prl_app/model/constant/theme.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProductsController controller = Get.put(HomeProductsController());
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorApp.darkMain,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: ColorApp.darkMain,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_filled,
                      color: ColorApp.secndApp,
                    ),
                    label: '',
                    activeIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.home_filled, color: ColorApp.mainApp),
                        Container(
                          margin: const EdgeInsetsDirectional.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.mainApp,
                          ),
                          height: 5,
                          width: 10,
                        )
                      ],
                    )),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.favorite,
                      color: ColorApp.secndApp,
                    ),
                    label: '',
                    activeIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite, color: ColorApp.mainApp),
                        Container(
                          margin: const EdgeInsetsDirectional.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.mainApp,
                          ),
                          height: 5,
                          width: 10,
                        )
                      ],
                    )),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: ColorApp.secndApp,
                    ),
                    label: '',
                    activeIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.notifications_active,
                            color: ColorApp.mainApp),
                        Container(
                          margin: const EdgeInsetsDirectional.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.mainApp,
                          ),
                          height: 5,
                          width: 10,
                        )
                      ],
                    )),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.settings,
                      color: ColorApp.secndApp,
                    ),
                    label: '',
                    activeIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.settings, color: ColorApp.mainApp),
                        Container(
                          margin: const EdgeInsetsDirectional.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.mainApp,
                          ),
                          height: 5,
                          width: 10,
                        )
                      ],
                    )),
              ],
            ),
          ),
         body: IndexedStack(
          index: controller.currentIndex.value,
          // ignore: invalid_use_of_protected_member
          children: controller.tape.value,
        ),),
      );
    });
  }
}
