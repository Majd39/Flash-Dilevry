import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/favoreteController.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Home/bottun_container_icon_widget.dart';
import 'package:prl_app/view/widgets/Home/favorit/favorite_widget.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(FavoriteController());

    // Load favorites when the screen is initialized
    favoriteController.loadFavorites();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        body: Obx(() {
          if (favoriteController.favoriteProducts.isEmpty) {
            return const Center(
              child: TextWidget(
                data: 'No favorites yet!',
                color: ColorApp.lightMain,
                fontWeight: FontWeight.bold,
                size: 20,
              ),
            );
          }

          return Container(
            margin: const EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BottunContainerIconWidget(),
                    const TextWidget(
                      data: 'Favorite',
                      color: ColorApp.lightMain,
                      fontWeight: FontWeight.w400,
                      size: 24,
                    ),
                    Image.asset(
                      ImageRouts.logo,
                      height: 38,
                      width: 38,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteController.favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final productId =
                          favoriteController.favoriteProducts.elementAt(index);
                      return Dismissible(
                        key: ValueKey(productId),
                        background: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          height: 100,
                          color: Colors.redAccent,
                          child: const Row(
                            children: [
                              Spacer(flex: 3),
                              Text('Delete'),
                              Spacer(),
                              Icon(
                                Icons.delete_forever_outlined,
                                size: 50,
                                color: ColorApp.lightMain,
                              ),
                            ],
                          ),
                        ),
                        onDismissed: (_) {
                          favoriteController.toggleFavorite(productId);
                        },
                        child: FavoriteWidget(
                          productId: productId,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
