import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/favorite_provider.dart';
import '../model/product_model.dart';
import 'product_detailscreen.dart'; // Ensure the import is correct

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
      ),
      body: favoriteProvider.favorites.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
        itemCount: favoriteProvider.favorites.length,
        itemBuilder: (context, index) {
          final product = favoriteProvider.favorites[index];
          return ListTile(
            leading: Image.asset(
              product.imageAssetPath,
              fit: BoxFit.cover,
              width: 50,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.priceAfterDiscount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                favoriteProvider.removeFavorite(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} removed from favorites!')),
                );
              },
            ),
            onTap: () {
              // Navigate to product detail screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
              );
            },
          );
        },
      ),
    );
  }
}
