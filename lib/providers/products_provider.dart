import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> loadProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(response);

      print('Loaded JSON data: $data');

      _items = data
          .map((item) => Product(
                id: item['id'],
                title: item['title'],
                description: item['description'],
                price: item['price'],
                imageUrl: item['imageUrl'],
              ))
          .toList();

      print('Parsed products: $_items');

      notifyListeners();
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void toggleFavoriteStatus(String id) {
    final product = _items.firstWhere((prod) => prod.id == id);
    product.toggleFavoriteStatus();
    notifyListeners();
  }
}
