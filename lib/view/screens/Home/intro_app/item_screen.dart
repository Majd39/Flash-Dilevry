import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/productController.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';
import 'package:readmore/readmore.dart';

class ItemScreen extends StatelessWidget {
  final Productcontroller controller = Get.put(Productcontroller());
  final int productIndex;

  ItemScreen({super.key, required this.productIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        appBar: AppBar(
          backgroundColor: ColorApp.darkMain,
          actions: [
            IconButton(
              onPressed: () {
                // Add favorite functionality here
              },
              icon: const Icon(Icons.favorite_border, color: ColorApp.lightMain),
            ),
          ],
          centerTitle: true,
          title: const TextWidget(
            data: 'Detail',
            color: ColorApp.lightMain,
            fontWeight: FontWeight.bold,
            size: 24,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios, color: ColorApp.lightMain),
          ),
        ),
        body: Obx(() {
          if (controller.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (productIndex >= controller.products.length) {
            return const Center(
              child: Text(
                'Product not found',
                style: TextStyle(color: ColorApp.lightMain),
              ),
            );
          } else {
            final selectedProduct = controller.products[productIndex];
            return Column(
              children: [
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 3,
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      selectedProduct.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, color: ColorApp.lightMain),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: ColorApp.darkMain,
                    ),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              data: selectedProduct.name,
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 24,
                            ),
                            const Spacer(),
                            TextWidget(
                              data: '${selectedProduct.price.toStringAsFixed(2)} \$',
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            TextWidget(
                              data: selectedProduct.storeName,
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.w400,
                              size: 20,
                            ),
                            const Spacer(),
                            const TextWidget(
                              data: 'Location ',
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.w400,
                              size: 20,
                            ),
                            const Icon(Icons.location_on_outlined,
                                color: ColorApp.mainApp),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const TextWidget(
                          data: 'Description',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.w400,
                          size: 20,
                        ),
                        const SizedBox(height: 4),
                        ReadMoreText(
                          selectedProduct.description,
                          trimMode: TrimMode.Line,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: ColorApp.lightMain.withOpacity(0.70),
                            height: 2,
                          ),
                          trimLines: 3,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.mainApp,
                          ),
                          lessStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.mainApp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
