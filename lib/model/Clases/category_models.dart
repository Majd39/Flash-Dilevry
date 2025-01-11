class Category {
  final String categoryName;
  final String categoryImage;

  Category({required this.categoryName, required this.categoryImage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['category_name'],
      categoryImage: json['category_image'],
    );
  }

  static List<Category> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }
}
