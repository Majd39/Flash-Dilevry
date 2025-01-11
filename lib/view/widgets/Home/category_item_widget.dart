import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/controlar/controllers/Home/home_products_controller.dart';
import 'package:prl_app/model/Clases/category_models.dart';  // Import the Category model
import 'package:prl_app/model/constant/theme.dart';
import 'package:prl_app/view/widgets/Public/text_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: GetX<HomeProductsController>(
          builder: (controller) {
            if (controller.categories.isEmpty) {
              return Center(child: CircularProgressIndicator());  // Show loading spinner if categories are not fetched
            } else {
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  controller.categories.length,
                  (index) => Card(
                    color: ColorApp.darkMain,
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
                              color: Colors.grey,  // Placeholder for category color
                            ),
                            height: 128,
                            width: 140,
                            child: Center(
                              child: Image.network(controller.categories[index].categoryImage),  // Load image from URL
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
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
              );
            }
          },
        ),
      ),
    );
  }
}
