import 'package:get/get.dart';
import 'package:prl_app/model/Clases/stores_models.dart';
import 'package:prl_app/services/storeService.dart';

class Storecontroller extends GetxController{
    late RxList<StoresModels> stores = <StoresModels>[].obs;
Storeservice storeservice =Storeservice();
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStores();
  }
 void fetchStores() async {
    try {
      print('Fetching stores...');
      List<StoresModels> fetchedStores = await storeservice.fetchStores();
      stores.value = fetchedStores;
      print('Stores fetched successfully.');
    } catch (e) {
      print('Error while fetching stores: $e');
      Get.snackbar('Error', 'Failed to load stores. Please try again.');
    }
  }
}