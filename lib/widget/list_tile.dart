import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/cart_provider.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      leading: Image.asset(
        cartItem.product.imageAssetPath,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
      ),
      title: Text(cartItem.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text('Price: \$${cartItem.product.priceAfterDiscount.toStringAsFixed(2)}'),

        ],
      ),
      trailing: Container(
        width: 160, // Adjust width to fit all buttons
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Decrease Button
            Flexible(
              child: IconButton(
                icon: Icon(Icons.remove, color: Theme.of(context).colorScheme.primary, size: 16),
                onPressed: () {
                  cartProvider.decreaseQuantity(cartItem.product);
                },
              ),
            ),
            // Quantity Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${cartItem.quantity}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Increase Button
            Flexible(
              child: IconButton(
                icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary, size: 16),
                onPressed: () {
                  cartProvider.increaseQuantity(cartItem.product);
                },
              ),
            ),
            // Trash Icon for Removing the Item
            Flexible(
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  cartProvider.removeItem(cartItem.product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
