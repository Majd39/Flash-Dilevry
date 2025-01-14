import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/introApp/categoryControlller.dart';
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/screens/Home/storeByCategory.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.put to initialize the controller
    final Categorycontrolller controller = Get.put(Categorycontrolller());

    // Use Obx to make the UI reactive to controller changes
    return Obx(() {
      // Check if categories are empty
      if (controller.categories.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {print("CategoryItemWidget");
        return SingleChildScrollView(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              controller.categories.length,
              (index) => GestureDetector(
                onTap: () {
                  final selectedCategory = controller.categories[index].categoryName;
                  Get.to(() => StoresByCategoryPage(categoryName: selectedCategory));
                },
                child: Card(
                  color: ColorApp.secndApp,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                      top: 12,
                      start: 12,
                      end: 12,
                      bottom: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey,
                          ),
                          height: 128,
                          width: 140,
                          child: Center(
                            child: Image.network(controller.categories[index].categoryImage),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextWidget(
                          data: controller.categories[index].categoryName,
                          color: ColorApp.lightMain,
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
