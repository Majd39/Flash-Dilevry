class ProductsModels {
  final String name;
  final String imageUrl;
  final double price;
  final String storeName;
  final String description;
 final String productId ;
  int quantityItem = 1;

  ProductsModels({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.storeName,
    required this.description,
   required this.productId ,
    this.quantityItem = 1,
  });

  factory ProductsModels.fromJson(Map<String, dynamic> json) {
    return ProductsModels(
      name: json['product_name'] ?? 'Unknown',
      imageUrl: json['product_image'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      storeName: json['store_name'] ?? 'Unknown Store',
      description: json['description'] ?? 'No description available',
      productId: json['product_id']?.toString() ?? '0',
      quantityItem: json['quantity_item'] ?? 1,
    );
  }

  static List<ProductsModels> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModels.fromJson(json)).toList();
  }
}
