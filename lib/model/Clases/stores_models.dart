
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
        storeName: json['store_name'],
        storeImage: json['store_image'],
        categoryName: json['category_name'],
        address: json['address'],
      );
    }).toList();
  }
}
