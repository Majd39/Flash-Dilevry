
class StoresModels {
  final String storeName;
  final String storeImage;
  final String categoryName;
  final String address;

  StoresModels({
    required this.storeName,
    required this.storeImage,
    required this.categoryName,
    required this.address,
  });

  // Factory method to create a list of StoresModels from JSON
  static List<StoresModels> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) {
      return StoresModels(
        storeName: json['store_name'] ?? 'Unknown Store', // Default if null
        storeImage: json['store_image'] ?? '', // Handle null with empty string
        categoryName: json['category_name'] ?? 'Unknown Category', // Default if null
        address: json['address'] ?? 'Unknown Address', // Default if null
      );
    }).toList();
  }
}
