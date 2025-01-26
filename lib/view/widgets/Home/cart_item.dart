import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/favoreteController.dart';
import 'package:prl_app/controlar/controllers/Home/introApp/productController.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/screens/Home/intro_app/item_screen.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  final Productcontroller controller = Get.put(Productcontroller());
FavoriteController favoriteController=Get.put(FavoriteController());
  CartItem({super.key, required Null Function({required ProductsModels item}) onTap});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.products.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      };

      return SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            controller.products.length,
            (index) {
              final product = controller.products[index];
              return InkWell(
                onTap: () {
              Get.to(() => ItemScreen(productIndex: index));
                },
                child: Card(
                  color: ColorApp.s,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 238,
                    width: 164,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorApp.s,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              height: 116,
                              width: 140,
                              child: Center(
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                            ),
                            Obx(() {
  return   IconButton(
        onPressed: () {
          favoriteController.toggleFavorite("${product.productId}");
        },
        icon: Icon(
          favoriteController.isFavorite("${product.productId}")
              ? Icons.favorite
              : Icons.favorite_border,
          color: favoriteController.isFavorite("${product.productId}") ? Colors.red : Colors.grey,
        ),
      );
    })
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextWidget(
                          data: product.name,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          data: product.storeName,
                          color: ColorApp.lightMain.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          size: 9,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              data: '${product.price.toStringAsFixed(2)} \$',
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                            InkWell(
                              onTap: () {
                                // Handle add to cart action
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: ColorApp.mainApp,
                                ),
                                height: 30,
                                width: 30,
                                child: const Icon(
                                  Icons.add,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
