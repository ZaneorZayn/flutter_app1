import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_app/screen/product_detailscreen.dart';
import 'package:mobile_app/screen/product_seacrh.dart';
import 'package:provider/provider.dart';
import '../controller/provider/cart_provider.dart';
import '../controller/provider/favorite_provider.dart';
import '../model/product_model.dart';
import 'cart_screen.dart';
import 'doctor_screen.dart';
import 'favorite_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String selectedCategory = 'All'; // Default category

  List<String> categories = [
    'All',
    'Condom',
    'Contraceptive',
    'Lubricant',
    'Orasel',
  ];

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the CartProvider and FavoriteProvider
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    // Filter products based on the selected category
    final filteredProducts = dummyProducts.where((product) {
      final matchesCategory = selectedCategory == 'All' || product.category == selectedCategory;
      return matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: Theme.of(context).textTheme.displayLarge),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductSearchScreen(),
                ),
              );
            },
          ),
          _buildFavoriteIcon(favoriteProvider),
          _buildCartIcon(cartProvider),
        ],
        elevation: 4,
        shadowColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductBannerSlider(),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 50.0,
              maxHeight: 50.0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: _buildCategoryListView(),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7, // Adjust as needed to control item height
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final product = filteredProducts[index];
                return ProductGridItem(product: product);
              },
              childCount: filteredProducts.length,
            ),
          ),
        ],
      ),
      floatingActionButton: cartProvider.items.isNotEmpty
          ? _buildFloatingActionButton(cartProvider, context)
          : null, // Hide FAB if cart is empty
    );
  }

  Widget _buildFavoriteIcon(FavoriteProvider favoriteProvider) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
          },
        ),
        if (favoriteProvider.favorites.isNotEmpty)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '${favoriteProvider.favorites.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCartIcon(CartProvider cartProvider) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
        ),
        if (cartProvider.items.isNotEmpty)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '${cartProvider.items.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCategoryListView() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                _selectCategory(category);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: selectedCategory == category
                      ? Theme.of(context).colorScheme.onSecondary
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: selectedCategory == category ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(CartProvider cartProvider, BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartScreen()),
        );
      },
      label: Row(
        children: [
          Icon(Icons.shopping_cart, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            'View Cart',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Add padding when at the top of the scroll
    final double paddingValue = shrinkOffset == 0 ? 16.0 : 0.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}



class ProductGridItem extends StatelessWidget {
  final Product product;

  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 155, // Smaller height for the image
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      product.imageAssetPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.displayMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '\$${product.priceAfterDiscount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(width: 8),
                          if (product.discountPercentage > 0)
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: favoriteProvider.isFavorite(product)
                                ? Icon(Icons.favorite, color: Colors.red)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              if (favoriteProvider.isFavorite(product)) {
                                favoriteProvider.removeFavorite(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${product.name} removed from favorites!')),
                                );
                              } else {
                                favoriteProvider.addFavorite(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${product.name} added to favorites!')),
                                );
                              }
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.secondary
                            ),
                            onPressed: () {
                              cartProvider.addItem(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${product.name} added to cart!')),
                              );
                            },
                            child: Text(
                              'Add to Cart',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (product.discountPercentage > 0)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '-${product.discountPercentage}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

