import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/view/screens/Home/NavBar/favorite_screen.dart';
import 'package:prl_app/view/screens/Home/NavBar/notifications_screen.dart';
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
}

class HomeProductsController extends AbsHomeProductsController {

  late RxInt currentIndex = 0.obs;
  late RxInt index = 0.obs;

  // final section = [
  //   CartItem(
  //     onTap: ({required ProductsModels item}) {
  //       viewDetail(item);
  //     },
  //   ),
  //   CategoryItemWidget(),
  //   const CardStoreWidget(),
  // ].obs;

  final tape = [
    const HomeProductsScreen(),
    const FavoriteScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ].obs;


  late RxList<Widget> section;

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
    Get.toNamed(Routes.itemScreen , arguments:{'item':item} );
  }
}
