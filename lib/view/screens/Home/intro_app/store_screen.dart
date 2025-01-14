import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/routes/image_routs.dart';
import 'package:prl_app/view/widgets/Home/cart_item.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the store data passed via Get.arguments
    final store = Get.arguments['store'];
print("StoreScreen");
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.darkMain,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3.8,
              child: Stack(
                children: [
                  Image.network(
                    '${store.storeImage}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 64),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          data: store.storeName,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorApp.lightMain.withOpacity(0.75),
                            ),
                            const SizedBox(width: 8),
                            TextWidget(
                              data: store.address,
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: ColorApp.lightMain.withOpacity(0.75),
                            ),
                            const SizedBox(width: 8),
                            TextWidget(
                              data: store.categoryName,
                              color: ColorApp.lightMain.withOpacity(0.75),
                              fontWeight: FontWeight.w400,
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Display the product list
            CartItem(
              onTap: ({required ProductsModels item}) {
                // Add your product detail navigation or functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
