
import 'package:get/get.dart';

class BagController extends GetxController {
  //final List<ProductsModels> products = ProductsModels.products;
  final List<RxInt> quantities = [];
  final RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
  //  quantities.addAll(List.generate(products.length, (index) => 1.obs));
    calculateTotalPrice();
    super.onInit();
  }

  void incrementQuantity(int index) {
    quantities[index].value++;
    calculateTotalPrice();
  }

  void decrementQuantity(int index) {
    if (quantities[index].value > 1) {
      quantities[index].value--;
      calculateTotalPrice();
    }
  }

  int getQuantity(int index) {
    return quantities[index].value;
  }

  void calculateTotalPrice() {
  /*  for (int i = 0; i < products.length; i++) {
      total += products[i].pris * quantities[i].value;
    }
    totalPrice.value = total;
  }*/

  }}