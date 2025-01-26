// ignore: file_names
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';
import 'package:prl_app/services/productService.dart';

class Productcontroller extends GetxController {
  var products = <ProductsModels>[].obs;
  final Productservice service = Productservice();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final fetchedProducts = await service.fetchProducts();
      products.value = fetchedProducts;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products. Please try again.'  );
    }
  }
  
}
