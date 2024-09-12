import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/cart_provider.dart';
import '../widget/list_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartProvider.items.isEmpty
          ? Center(
        child: Text(
          'No products in your cart',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
          : ListView.separated(
        separatorBuilder: (context,index) => Divider(color: Colors.grey[300],),
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.items[index];
          return CartItemTile(cartItem: cartItem);
        },
      ),
      bottomNavigationBar: cartProvider.items.isEmpty
          ? SizedBox.shrink() // Hides the bottom bar if no items in the cart
          : SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Increase button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Checkout',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Total: \$${cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
