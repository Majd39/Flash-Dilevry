import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/services/categoryService.dart';

class Categorycontrolller extends GetxController {
  late RxList<Category> categories = <Category>[].obs;
  CategoryService service = CategoryService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      print('Fetching categories...');
      List<Category> fetchedCategories = await service.fetchCategories();

      // Update categories and show success message
      categories.value = fetchedCategories;
      print('Categories fetched successfully.');

      // Show success message using Snackbar
      Get.snackbar(
        "Success",
        "Categories fetched successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      print('Error while fetching categories: $e');
      // Handle the error and provide feedback to the user
      Get.snackbar('Error', 'Failed to load categories. Please try again.');
    }
  }
}
