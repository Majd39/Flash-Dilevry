import 'package:prl_app/model/data/API.dart';

class Category {
  final String categoryName;
  final String categoryImage;

  Category({required this.categoryName, required this.categoryImage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['category_name'] ?? 'Unknown Category',  // Default name if null
      categoryImage: _getFullImagePath(json['category_image']),  // Ensure it's a full URL
    );
  }

  static List<Category> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }

  // Helper method to construct the full URL for category images
  static String _getFullImagePath(String imagePath) {
    final baseUrl = Api.homeUrl;  // Replace with your actual base URL
    if (imagePath.startsWith('http')) {
      return imagePath;  // Already a full URL
    }
    return "$baseUrl/$imagePath";  // Add base URL if it's a relative path
  }
}
