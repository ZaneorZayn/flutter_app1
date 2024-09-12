import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/product_model.dart';
import 'dart:convert'; // For encoding/decoding JSON

class FavoriteProvider with ChangeNotifier {
  List<Product> _favorites = [];

  FavoriteProvider() {
    _loadFavorites();
  }

  List<Product> get favorites => _favorites;

  // Add product to favorites and save it in SharedPreferences
  void addFavorite(Product product) {
    if (!_favorites.contains(product)) {
      _favorites.add(product);
      _saveFavorites();
      notifyListeners();
    }
  }

  // Remove product from favorites and update SharedPreferences
  void removeFavorite(Product product) {
    _favorites.remove(product);
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }

  // Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoritesJson = prefs.getString('favorites');

    if (favoritesJson != null) {
      List decodedFavorites = jsonDecode(favoritesJson);
      _favorites = decodedFavorites
          .map((item) => Product.fromJson(item)) // Assuming you have fromJson method in Product model
          .toList();
      notifyListeners();
    }
  }

  // Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoritesJson = jsonEncode(_favorites.map((product) => product.toJson()).toList());
    prefs.setString('favorites', favoritesJson);
  }
}
