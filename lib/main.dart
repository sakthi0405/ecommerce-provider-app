import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
