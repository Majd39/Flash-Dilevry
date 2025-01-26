import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/Clases/stores_models.dart';
import 'package:prl_app/services/storeService.dart';

class Storecontroller extends GetxController{
    late RxList<StoresModels> stores = <StoresModels>[].obs;
Storeservice storeservice =Storeservice();
  late RxString errorMessage = ''.obs; // Add an error message observable

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStores();
  }
 void fetchStores() async {
    try {
      List<StoresModels> fetchedStores = await storeservice.fetchStores();
      stores.value = fetchedStores;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load stores. Please try again.');
    }
  }

  void fetchStoresByCategory(String categoryName) async {
    try {
      List<StoresModels> fetchedStores = await storeservice.fetchStoresByCategory(categoryName);
      stores.value = fetchedStores;
      errorMessage.value = ''; // Clear any previous error message
    } catch (e) {
      if (e is Exception) {
        errorMessage.value = e.toString(); // Store the actual error message from the backend
      }
      Get.snackbar('Error', errorMessage.value,backgroundColor: const Color(0x66FF0000));
    }
  }

}