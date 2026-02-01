import 'package:flutter/material.dart';
import '../product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _carts = [];

  List<Product> get carts => _carts;

  void addToCart(Product product) {
    if (!_carts.contains(product)) {
      _carts.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _carts.remove(product);
    notifyListeners();
  }

  bool isCarted(Product product) {
    return _carts.contains(product);
  }
}
