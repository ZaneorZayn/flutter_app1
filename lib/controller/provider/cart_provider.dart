import 'package:flutter/material.dart';
import '../../model/cart_model.dart';
import '../../model/product_model.dart';


class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(Product product, [int quantity = 1]) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity; // Increase the quantity by the specified amount
    } else {
      _items.add(CartItem(product: product, quantity: quantity)); // Add the product with the specified quantity
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0 && _items[existingIndex].quantity > 1) {
      _items[existingIndex].quantity--;
      notifyListeners();
    }
  }


}
