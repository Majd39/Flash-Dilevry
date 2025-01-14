import 'package:get/get.dart';
import 'package:prl_app/services/favoreteService.dart';

class FavoriteController extends GetxController {
  final FavoriteService favoriteService = FavoriteService();
  var favoriteProducts = <String>{}.obs; // Set of product IDs marked as favorites.
  Future<void> loadFavorites() async {
    final favorites = await favoriteService.getFavorites();
    favoriteProducts.addAll(favorites);
  }

  Future<void> toggleFavorite(String productId) async {
    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
      Get.snackbar('Info', 'Removed from favorites');
    } else {
      final success = await favoriteService.addToFavorites(productId);
      if (success) {
        favoriteProducts.add(productId);
        Get.snackbar('Success', 'Added to favorites');
      }
    }
  }

  bool isFavorite(String productId) {
    return favoriteProducts.contains(productId);
  }
}
