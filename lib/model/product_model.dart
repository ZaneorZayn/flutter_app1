import 'dart:math';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageAssetPath;
  final String category;
  final double discountPercentage;
  final double priceAfterDiscount;
  final int reviewCount; // Added reviewCount property

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAssetPath,
    required this.category,
    required this.discountPercentage,
    required this.reviewCount, // Added reviewCount to constructor
  }) : priceAfterDiscount = calculatePriceAfterDiscount(price, discountPercentage);

  static double calculatePriceAfterDiscount(double price, double discountPercentage) {
    return price - (price * (discountPercentage / 100));
  }
}

List<Product> dummyProducts = [
  Product(
    name: 'Number One Classic Love',
    description: 'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.'
        'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.'
        'High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.High-quality wireless headphones with noise cancellation.',
    price: 15.0,
    imageAssetPath: 'assets/images/classic.png',
    category: 'Condom',
    discountPercentage: 20,
    reviewCount: 10, // Example review count
  ),
  Product(
    name: 'Number One Banana Love',
    description: 'Latest model smartphone with all the modern features.',
    price: 14.0,
    imageAssetPath: 'assets/images/banana.png',
    category: 'Condom',
    discountPercentage: 15,
    reviewCount: 95, // Example review count
  ),
  Product(
    name: 'Number One OK',
    description: 'Comfortable and durable running shoes for daily use.',
    price: 10.0,
    imageAssetPath: 'assets/images/OK.png',
    category: 'Condom',
    discountPercentage: 20,
    reviewCount: 60, // Example review count
  ),
  Product(
    name: 'Number One Berry Love',
    description: 'Stylish backpack with multiple compartments.',
    price: 15.0,
    imageAssetPath: 'assets/images/berry.png',
    category: 'Accessories',
    discountPercentage: 5,
    reviewCount: 30, // Example review count
  ),
  Product(
    name: 'Number One Dotted',
    description: 'Elegant wristwatch with leather strap and water resistance.',
    price: 14.0,
    imageAssetPath: 'assets/images/dotted.png',
    category: 'Fashion',
    discountPercentage: 0,
    reviewCount: 50, // Example review count
  ),
  Product(
    name: 'Number One Thin Love',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/thin_love.png',
    category: 'Electronics',
    discountPercentage: 10,
    reviewCount: 80, // Example review count
  ),
];


