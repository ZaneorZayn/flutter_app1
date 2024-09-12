class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageAssetPath;
  final String category;
  final double discountPercentage;
  final double priceAfterDiscount;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageAssetPath,
    required this.category,
    required this.discountPercentage,
    required this.reviewCount,
  }) : priceAfterDiscount = calculatePriceAfterDiscount(price, discountPercentage);

  // Calculate the price after discount
  static double calculatePriceAfterDiscount(double price, double discountPercentage) {
    return price - (price * (discountPercentage / 100));
  }

  // Convert Product object to JSON (serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageAssetPath': imageAssetPath,
      'category': category,
      'discountPercentage': discountPercentage,
      'priceAfterDiscount': priceAfterDiscount,
      'reviewCount': reviewCount,
    };
  }

  // Create Product object from JSON (deserialization)
  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageAssetPath: json['imageAssetPath'],
      category: json['category'],
      discountPercentage: json['discountPercentage'],
      reviewCount: json['reviewCount'],
    );
  }
}

List<Product> dummyProducts = [
  Product(
    id: 'p1',
    name: 'Number One Classic Love',
    description: 'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.'
        'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.'
        'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.',
    price: 15.0,
    imageAssetPath: 'assets/images/classic.png',
    category: 'Condom',
    discountPercentage: 0,
    reviewCount: 10,
  ),
  Product(
    id: 'p2',
    name: 'Number One Banana Love',
    description: 'Latest model smartphone with all the modern features.',
    price: 14.0,
    imageAssetPath: 'assets/images/banana.png',
    category: 'Condom',
    discountPercentage: 15,
    reviewCount: 95,
  ),
  Product(
    id: 'p3',
    name: 'Number One OK',
    description: 'Comfortable and durable running shoes for daily use.',
    price: 10.0,
    imageAssetPath: 'assets/images/OK.png',
    category: 'Condom',
    discountPercentage: 20,
    reviewCount: 60,
  ),
  Product(
    id: 'p4',
    name: 'Number One Berry Love',
    description: 'Stylish backpack with multiple compartments.',
    price: 15.0,
    imageAssetPath: 'assets/images/berry.png',
    category: 'Condom',
    discountPercentage: 5,
    reviewCount: 30,
  ),
  Product(
    id: 'p5',
    name: 'Number One Dotted',
    description: 'Elegant wristwatch with leather strap and water resistance.',
    price: 14.0,
    imageAssetPath: 'assets/images/dotted.png',
    category: 'Condom',
    discountPercentage: 0,
    reviewCount: 50,
  ),
  Product(
    id: 'p6',
    name: 'Number One Thin Love',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/thin_love.png',
    category: 'Condom',
    discountPercentage: 10,
    reviewCount: 80,
  ),
  Product(
    id: 'p7',
    name: 'Lubricant Banana',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/lubricant_bana.png',
    category: 'Lubricant',
    discountPercentage: 10,
    reviewCount: 80,
  ),
  Product(
    id: 'p8',
    name: 'Lubricant Cucumber',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/lubricant_cucum.png',
    category: 'Lubricant',
    discountPercentage: 10,
    reviewCount: 80,
  ),
  Product(
    id: 'p9',
    name: 'Ok Pill',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/Okpill.png',
    category: 'Contraceptive',
    discountPercentage: 10,
    reviewCount: 80,
  ),
  Product(
    id: 'p10',
    name: 'Meuri',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/meuri.png',
    category: 'Contraceptive',
    discountPercentage: 10,
    reviewCount: 80,
  ),
  Product(
    id: 'p11',
    name: 'Orasel',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/orasel.png',
    category: 'Orasel',
    discountPercentage: 15,
    reviewCount: 80,
  ),
];

