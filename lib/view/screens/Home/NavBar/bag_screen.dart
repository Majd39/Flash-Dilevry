import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/navBar/bag_controller.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class BagScreen extends StatelessWidget {
  BagScreen({super.key});

  final int value = 0;
  final List<ProductsModels> products = ProductsModels.products;

  @override
  Widget build(BuildContext context) {
    final BagController controller = Get.put(BagController());
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
            size: 24),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: ColorApp.lightMain, size: 24)),
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: ColorApp.lightMain,
            size: 24,
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                products.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorApp.s,
                  ),
                  height: 100,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              products[index].imageUrl,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                              data: products[index].name,
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 16),
                          TextWidget(
                              data: products[index].storeName,
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.bold,
                              size: 12),
                          TextWidget(
                              data: '${products[index].pris} \$',
                              color: ColorApp.lightMain,
                              fontWeight: FontWeight.bold,
                              size: 16),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsetsDirectional.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorApp.mainApp,
                        ),
                        width: 40,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.incrementQuantity(index);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 24,
                                  color: ColorApp.darkMain,
                                )),
                            Obx(
                              () => TextWidget(
                                data: '${controller.getQuantity(index)}',
                                color: ColorApp.darkMain,
                                fontWeight: FontWeight.bold,
                                size: 24.0, // <-- استخدم قيمة صحيحة مثل 24.0
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.decrementQuantity(index);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 24,
                                  color: ColorApp.darkMain,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorApp.lightMain, width: 2),
                  ),
                  // width: 60,
                  height: 46,
                  child: Obx(
                        () => Center(
                      child: TextWidget(
                        data: '${controller.totalPrice.value}', // استخدم .value هنا
                        color: ColorApp.lightMain,
                        fontWeight: FontWeight.bold,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              InkWell(
                onTap: () {
                  controller.purchase();
                },
                child: Container(
                  height: 48,
                  width: 240,
                  decoration: BoxDecoration(
                    color: ColorApp.mainApp,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Purchase",
                        style: TextStyle(
                          color: ColorApp.darkMain,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.shopping_cart,
                        size: 32,
                        color: ColorApp.darkMain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
