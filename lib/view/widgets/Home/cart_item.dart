import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/productController.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CartItem extends StatelessWidget {
  final Function({required ProductsModels item}) onTap;

  CartItem({Key? key, required this.onTap}) : super(key: key);

  final Productcontroller controller = Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.products.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return SingleChildScrollView( // Remove Expanded here
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            controller.products.length,
            (index) {
              final product = controller.products[index];
              return InkWell(
                onTap: () {
                  onTap(item: product);
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
                            const Icon(Icons.favorite, color: Colors.red),
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
