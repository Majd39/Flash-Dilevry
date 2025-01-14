import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/introApp/storeController.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/model/data/API.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';
class StoresByCategoryPage extends StatelessWidget {
  final String categoryName;

  StoresByCategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Storecontroller());

    controller.fetchStoresByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stores in $categoryName'),
        backgroundColor: ColorApp.mainApp,
      ),
      body: Obx(() {
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value, // Show the error message from the backend
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          );
        }

        if (controller.stores.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: controller.stores.map((store) {
              return Card(
                color: ColorApp.s,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    top: 12,
                    start: 12,
                    end: 12,
                    bottom: 6,
                  ),
                  height: 238,
                  width: 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 128,
                        width: 140,
                        child: Image.network(
                          '${Api.homeUrl}/${store.storeImage}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image, size: 64);
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextWidget(
                        data: store.storeName,
                        color: ColorApp.lightMain.withOpacity(0.75),
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: ColorApp.mainApp, size: 14),
                          const SizedBox(width: 8),
                          TextWidget(
                            data: store.address,
                            color: ColorApp.lightMain.withOpacity(0.75),
                            fontWeight: FontWeight.w400,
                            size: 12,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.category_outlined,
                              color: ColorApp.mainApp, size: 12),
                          const SizedBox(width: 8),
                          TextWidget(
                            data: "",
                            color: ColorApp.lightMain.withOpacity(0.75),
                            fontWeight: FontWeight.w400,
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

