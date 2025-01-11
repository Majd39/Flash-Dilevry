import 'package:get/get.dart';
import 'package:prl_app/model/Clases/products_models.dart';

abstract class AbsHomeItemController extends GetxController {
  intItem();
  incremant() ;
  decremant() ;
}

class ItemController extends AbsHomeItemController {
  // ProductsModels item = Get.arguments['item'];
  late ProductsModels item; // تعريف العنصر
  late RxInt count = 0.obs;
  late RxDouble totalPris = 0.0.obs;
  @override
  void onInit() {
    count =0.obs ;
    if (Get.arguments['item'] != null) {
      item = Get.arguments['item'];
    } else {
      print("Error: No item data found.");
    }
    super.onInit();
  }
  @override
  intItem() {
  item = Get.arguments['item'];
  }

  decremant() {
    if (count.value > 0) {
      count.value--;
      culTotalPris();
    }
  }

  @override
  incremant() {
    count.value++;
    culTotalPris();
  }

  void culTotalPris() {
    totalPris.value = count.value * item.pris;
  }
  // @override
  // void onInit() {
  //   intItem();
  //   super.onInit();
  // }
}
