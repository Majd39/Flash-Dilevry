class ProductsModels {
  final String name;
  final String imageUrl;
  final double price;
  final String storeName;
  final String description;

  ProductsModels({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.storeName,
    required this.description,
  });

  factory ProductsModels.fromJson(Map<String, dynamic> json) {
    return ProductsModels(
      name: json['product_name'] as String,
      imageUrl: json['product_image'] as String,
      price: double.tryParse(json['price'] as String) ?? 0.0,
      storeName: json['store_name'] as String,
      description: json['description'] as String,
    );
  }

  static List<ProductsModels> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModels.fromJson(json)).toList();
  }
}
