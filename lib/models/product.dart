

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final String category;
  final double discount;
  final bool isFeatured;
  final List<String> platforms;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.category,
    required this.discount,
    required this.isFeatured,
    required this.platforms,
  });

  String get formattedPrice => '\$$price';
  String get formattedOriginalPrice => '\$$originalPrice';
  String get discountPercentage => '${discount.toInt()}%';
}

class Category {
  final String id;
  final String name;
  final String icon;
  final int productCount;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.productCount,
  });
}

