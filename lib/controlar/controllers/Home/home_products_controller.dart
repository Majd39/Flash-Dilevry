import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/model/Clases/stores_models.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/services/HomepageService.dart';
import 'package:prl_app/view/screens/Home/NavBar/bag_screen.dart';
import 'package:prl_app/view/screens/Home/NavBar/favorite_screen.dart';
import 'package:prl_app/view/screens/Home/NavBar/settings_screen.dart';
import 'package:prl_app/view/screens/Home/home_products_screen.dart';
import 'package:prl_app/view/widgets/Home/card_store_widget.dart';
import 'package:prl_app/view/widgets/Home/cart_item.dart';
import 'package:prl_app/view/widgets/Home/category_item_widget.dart';

abstract class AbsHomeProductsController extends GetxController {
  goToCategory();
  goToProducts();
  goToStores();
  viewDetail(ProductsModels item);
  fetchCategories();
}

class HomeProductsController extends AbsHomeProductsController {
  late RxInt currentIndex = 0.obs;
  late RxInt index = 0.obs;

  final tape = [
    const HomeProductsScreen(),
    const FavoriteScreen(),
     BagScreen(),
    const SettingsScreen(),
  ].obs;

  late RxList<Widget> section;
  late RxList<Category> categories = <Category>[].obs;
  late RxList<StoresModels> stores = <StoresModels>[].obs;

  final Homepageservice _homepageservice = Homepageservice();

  @override
  void onInit() {
    currentIndex = 0.obs;
    section = [
      CartItem(
        onTap: ({required ProductsModels item}) {
          viewDetail(item);
        },
      ),
      CategoryItemWidget(),
      const CardStoreWidget(),
    ].obs;
    fetchCategories(); // Fetch categories on initialization
    fetchStores();
    super.onInit();
  }

  @override
  goToCategory() {
    index.value = 1;
  }

  @override
  goToProducts() {
    index.value = 0;
  }

  @override
  goToStores() {
    index.value = 2;
  }

  @override
  viewDetail(ProductsModels item) {
    Get.toNamed(Routes.itemScreen, arguments: {'item': item});
  }

  @override
  void fetchCategories() async {
    try {
      print('Fetching categories...');
      List<Category> fetchedCategories = await _homepageservice.fetchCategories();
      categories.value = fetchedCategories;
      print('Categories fetched successfully.');
    } catch (e) {
      print('Error while fetching categories: $e');
      // Handle the error and provide feedback to the user
      Get.snackbar('Error', 'Failed to load categories. Please try again.');
    }
  }
    void fetchStores() async {
    try {
      print('Fetching stores...');
      List<StoresModels> fetchedStores = await _homepageservice.fetchStores();
      stores.value = fetchedStores;
      print('Stores fetched successfully.');
    } catch (e) {
      print('Error while fetching stores: $e');
      Get.snackbar('Error', 'Failed to load stores. Please try again.');
    }
  }
}
