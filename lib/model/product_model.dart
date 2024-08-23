class Product {
  final String name;
  final String description;
  final double price;
  final String imageAssetPath;
  final String category;
  final double discountPercentage;
  final double priceAfterDiscount;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAssetPath,
    required this.category,
    required this.discountPercentage,
  }) : priceAfterDiscount = calculatePriceAfterDiscount(price, discountPercentage);

  static double calculatePriceAfterDiscount(double price, double discountPercentage) {
    return price - (price * (discountPercentage / 100));
  }
}

List<Product> dummyProducts = [
  Product(
    name: 'Number One Classic Love',
    description: 'High-quality wireless headphones with noise cancellation.',
    price: 15.0,
    imageAssetPath: 'assets/images/classic.png',
    category: 'Electronics',
    discountPercentage: 10.0,
  ),
  Product(
    name: 'Number One Banana Love',
    description: 'Latest model smartphone with all the modern features.',
    price: 14.0,
    imageAssetPath: 'assets/images/banana.png',
    category: 'Electronics',
    discountPercentage: 15.0,
  ),
  Product(
    name: 'Number One OK',
    description: 'Comfortable and durable running shoes for daily use.',
    price: 10.0,
    imageAssetPath: 'assets/images/OK.png',
    category: 'Sportswear',
    discountPercentage: 20.0,
  ),
  Product(
    name: 'Number One Berry Love',
    description: 'Stylish backpack with multiple compartments.',
    price: 15.0,
    imageAssetPath: 'assets/images/berry.png',
    category: 'Accessories',
    discountPercentage: 5.0,
  ),
  Product(
    name: 'Number One Dotted',
    description: 'Elegant wristwatch with leather strap and water resistance.',
    price: 14.0,
    imageAssetPath: 'assets/images/dotted.png',
    category: 'Fashion',
    discountPercentage: 0.0,
  ),
  Product(
    name: 'Number One Thin Love',
    description: 'High-performance gaming laptop with advanced cooling system.',
    price: 15.0,
    imageAssetPath: 'assets/images/thin_love.png',
    category: 'Electronics',
    discountPercentage: 0.0,
  ),
];
