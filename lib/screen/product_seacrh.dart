import 'package:flutter/material.dart';
import 'package:mobile_app/screen/product_detailscreen.dart';
import '../model/product_model.dart';

class ProductSearchScreen extends StatefulWidget {
  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_updateSearchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearchQuery() {
    setState(() {
      filteredProducts = dummyProducts.where((product) {
        return product.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          cursorColor: Colors.white,
        ),
      ),
      body: filteredProducts.isNotEmpty
          ? ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return InkWell(
            child: ListTile(

              leading: CircleAvatar(
                backgroundImage: AssetImage(product.imageAssetPath),
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.priceAfterDiscount.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
                // Handle product selection
              },
            ),
          );
        },
      )
          : Center(
        child: Text(
          'No products found',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
