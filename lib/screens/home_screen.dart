import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'products_overview_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/badge.dart' as custom_widgets;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (_, cart, ch) => custom_widgets.Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsOverviewScreen(),
    );
  }
}
