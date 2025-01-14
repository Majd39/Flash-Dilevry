class ProductsModels {
  final String name;
  final String imageUrl;
  final double price;
  final String storeName;
  final String description;
  String product_id = "5"; // Default value

  ProductsModels({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.storeName,
    required this.description,
    this.product_id = "5", // Default value
  });

  factory ProductsModels.fromJson(Map<String, dynamic> json) {
    // Handle null values and unexpected data types
    return ProductsModels(
      name: json['product_name'] ?? 'Unknown', // Default to 'Unknown' if null
      imageUrl: json['product_image'] ?? '', // Empty string if null
      price: double.tryParse(json['price'].toString()) ?? 0.0, // Default to 0.0 if null or not parsable
      storeName: json['store_name'] ?? 'Unknown Store', // Default to 'Unknown Store'
      description: json['description'] ?? '', // Empty string if null
      product_id: json['product_id']?.toString() ?? "5", // Default to '4' if null
    );
  }

  static List<ProductsModels> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModels.fromJson(json)).toList();
  }
}
