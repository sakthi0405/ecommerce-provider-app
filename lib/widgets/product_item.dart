// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/products_provider.dart';
// import '../screens/product_detail_screen.dart';
// import '../models/product.dart';

// class ProductItem extends StatelessWidget {
//   final Product product;
//   ProductItem({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//       child: GestureDetector(
//         onTap: () {},
//         child: Image.network(
//           product.imageUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//       footer: GridTileBar(
//         backgroundColor: Colors.black87,
//         leading: IconButton(
//           icon: Icon(Icons.shopping_cart),
//           onPressed: () {
//             Provider.of<CartProvider>(context, listen: false).addItem(
//               product.id,
//               product.title,
//               product.price,
//             );
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Added item to cart!'),
//                 duration: Duration(seconds: 2),
//               ),
//             );
//           },
//         ),
//         title: Text(product.title),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          // Navigate to product details if needed
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(
            product.isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            // Toggle favorite logic
          },
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            cart.addItem(product.id, product.title, product.price);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Added ${product.title} to cart!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
