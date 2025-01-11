import 'package:flutter/material.dart';

import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';

import 'package:prl_app/view/widgets/Home/cart_item.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class StoreScreen extends StatelessWidget {
  final List<ProductsModels> product = ProductsModels.products;

   StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorApp.darkMain,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.8,
            child: Stack(
              children: [
                Image.asset(ImageRouts.big5),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                          data: 'Big Five ',
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 32),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorApp.lightMain.withOpacity(0.75),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget(
                              data: 'Damascus , Al-Midan ',
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              size: 16),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: ColorApp.lightMain.withOpacity(0.75),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget(
                              data: 'Grocery ',
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              size: 16),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CartItem(
            onTap: ({required ProductsModels item}) {
              // viewDetail(item);
              // Get.toNamed(Routes.itemScreen);
            },
          ),
        ],
      ),
    ));
  }
}
