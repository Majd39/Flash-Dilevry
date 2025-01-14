import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/introApp/productController.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';
import 'package:readmore/readmore.dart';

class ItemScreen extends StatelessWidget {
  final Productcontroller controller = Get.put(Productcontroller());
  final int productIndex;

  // To manage quantity and total price
  final RxInt quantity = 1.obs;

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
                        const SizedBox(height: 32),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (quantity.value > 1) {
                                      quantity.value--;
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: ColorApp.lightMain.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.remove,
                                        color:
                                            ColorApp.lightMain.withOpacity(0.70)),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                TextWidget(
                                  data: '${quantity.value}',
                                  color: ColorApp.lightMain,
                                  fontWeight: FontWeight.w400,
                                  size: 24,
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: () {
                                    quantity.value++;
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: ColorApp.mainApp,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Icon(Icons.add, size: 14),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorApp.lightMain,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Obx(() => TextWidget(
                                    data:
                                        '${(selectedProduct.price * quantity.value).toStringAsFixed(2)} \$',
                                    color: ColorApp.lightMain,
                                    fontWeight: FontWeight.bold,
                                    size: 20,
                                  )),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                // Add functionality to add to cart
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorApp.mainApp,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      data: 'Add to Cart',
                                      color: ColorApp.darkMain,
                                      fontWeight: FontWeight.bold,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 20,
                                      color: ColorApp.darkMain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
