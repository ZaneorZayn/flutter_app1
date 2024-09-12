import 'package:flutter/material.dart';
import 'package:mobile_app/screen/productscreen.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/cart_provider.dart';
import '../../model/product_model.dart';
import '../../widget/star_rating.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1; // Initial quantity

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    List<Product> relatedProducts = getRelatedProductsByCategory(widget.product.category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.product.imageAssetPath,
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      StarRating(rating: 4.5, reviewCount: widget.product.reviewCount),
                      const SizedBox(height: 8),
                      Text(
                        widget.product.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Category: ${widget.product.category}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (widget.product.discountPercentage > 0)
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.0,
                              ),
                            ),
                          if (widget.product.discountPercentage > 0)
                            const SizedBox(width: 8),
                          Text(
                            'Price: \$${widget.product.priceAfterDiscount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      if (widget.product.discountPercentage > 0)
                        Text(
                          'Discount: ${widget.product.discountPercentage.toStringAsFixed(0)}%',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Related Products',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 200, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relatedProducts.length,
                    itemBuilder: (context, index) {
                      final relatedProduct = relatedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(product: relatedProduct),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      relatedProduct.imageAssetPath,
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    relatedProduct.name,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      if (relatedProduct.discountPercentage > 0)
                                        Text(
                                          '\$${relatedProduct.price.toStringAsFixed(2)}',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.red,
                                            decorationThickness: 2,
                                          ),
                                        ),
                                      if (relatedProduct.discountPercentage > 0)
                                        const SizedBox(width: 8),
                                      Text(
                                        '\$${relatedProduct.priceAfterDiscount.toStringAsFixed(2)}',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (relatedProduct.discountPercentage > 0)
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      '${relatedProduct.discountPercentage.toStringAsFixed(0)}% OFF',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: Theme.of(context).colorScheme.surface
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 10.0, // This adds the shadow
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    // Quantity controls section
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, size: 16),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            '$quantity',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, size: 16),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    // Add to Cart button section
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          cartProvider.addItem(widget.product, quantity);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('added to cart!')),
                          );// Pass the quantity to addItem
                          Navigator.pop(context); // Navigate back to ProductScreen
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to get related products by category
  List<Product> getRelatedProductsByCategory(String category) {
    return dummyProducts.where((prod) => prod.category == category && prod != widget.product).toList();
  }
}
