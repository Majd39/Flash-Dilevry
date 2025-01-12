/*import 'package:get/get.dart';
import 'package:prl_app/model/Clases/category_models.dart';
import 'package:prl_app/model/Clases/stores_models.dart';

abstract class AbsStoreItemController extends GetxController {
  intItem();
}

class StoreItemController extends AbsStoreItemController {
  late StoresModels item; // تعريف العنصر

  @override
  void onInit() {
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

}
*/