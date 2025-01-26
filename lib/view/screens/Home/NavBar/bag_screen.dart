import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/navBar/bag_controller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class BagScreen extends StatelessWidget {
  BagScreen({super.key});
  final BagController controller = Get.put(BagController());

  @override
  Widget build(BuildContext context) {
    controller.fetchCartSummary();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorApp.darkMain,
          title: const TextWidget(
            data: 'Cart',
            color: ColorApp.lightMain,
            fontWeight: FontWeight.bold,
            size: 24,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: ColorApp.lightMain, size: 24),
          ),
          actions: const [
            Icon(
              Icons.shopping_bag_outlined,
              color: ColorApp.lightMain,
              size: 24,
            )
          ],
        ),
        body: Obx(() {
          if (controller.cartItems.isEmpty) {
            return const Center(
              child: TextWidget(
                data: 'Your cart is empty.',
                color: ColorApp.lightMain,
                fontWeight: FontWeight.bold,
                size: 20,
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = controller.cartItems[index];
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorApp.s,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product.imageUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image,
                                    size: 80, color: Colors.grey);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  data: product.name,
                                  color: ColorApp.lightMain,
                                  fontWeight: FontWeight.bold,
                                  size: 16,
                                ),
                                const SizedBox(height: 4),
                                TextWidget(
                                  data: product.description,
                                  color: ColorApp.lightMain.withOpacity(0.75),
                                  fontWeight: FontWeight.normal,
                                  size: 14,
                                ),
                                const SizedBox(height: 4),
                                TextWidget(
                                  data: '${product.price.toStringAsFixed(2)} \$',
                                  color: ColorApp.lightMain,
                                  fontWeight: FontWeight.bold,
                                  size: 16,
                                ),
                                const SizedBox(height: 4),
                                TextWidget(
                                  data: 'Quantity: ${product.quantityItem}',
                                  color: ColorApp.lightMain.withOpacity(0.75),
                                  fontWeight: FontWeight.normal,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorApp.darkMain,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          data: 'Total Items:',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                        TextWidget(
                          data: '${controller.totalItems.value}',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          data: 'Total Price:',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                        TextWidget(
                          data: '${controller.totalPrice.value.toStringAsFixed(2)} \$',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to confirm the purchase process
                        Get.snackbar(
                          'Purchase Confirmed',
                          'Your purchase has been successfully completed!',
                          backgroundColor: ColorApp.mainApp,
                          colorText: ColorApp.lightMain,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.mainApp,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.shopping_cart, color: ColorApp.lightMain),
                          SizedBox(width: 8),
                          Text(
                            ' Purchase',
                            style: TextStyle(
                              color: ColorApp.darkMain,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
