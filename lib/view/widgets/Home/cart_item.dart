import 'package:flutter/material.dart';

import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CartItem extends StatelessWidget {
  CartItem({
    super.key,
    required this.onTap,
  });

  final List<ProductsModels> product = ProductsModels.products;

  //final HomeProductsController controller = Get.put(HomeProductsController());
  final Function({required ProductsModels item }) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(
            product.length,
            (index) => InkWell(
              onTap: () {
                print('Product data: ${product[index]}');
                onTap(item:product[index] );
                // controller.viewDetail(product[index]);
              },
              child: Card(
                color: ColorApp.s,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      top: 12, start: 12, end: 12, bottom: 6),
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
                          Container(
                            height: 128,
                            width: 140,
                            // margin: EdgeInsetsDirectional.symmetric(horizontal: 12 , vertical: 8),
                            child: Center(
                              child: Image.asset(product[index].imageUrl,fit: BoxFit.fitHeight,),
                            ),
                          ),
                          Icon(Icons.favorite, color: Colors.red)
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextWidget(
                          data: product[index].name,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 16),
                      const SizedBox(
                        height: 4,
                      ),
                      TextWidget(
                          data: product[index].storeName,
                          color: ColorApp.lightMain.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          size: 12),
                      const SizedBox(
                        height: 6,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                                data: '${product[index].pris} \$',
                                color: ColorApp.lightMain,
                                fontWeight: FontWeight.bold,
                                size: 20),
                            InkWell(
                              onTap: () {},
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
