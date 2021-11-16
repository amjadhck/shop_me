import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/providers/product.dart';
import 'package:shop_me/providers/products_provider.dart';
import 'package:shop_me/widgets/badge.dart';

import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const id = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child!,
              value: cart.quantityCount.toString(),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.id);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(loadedProduct.price.toString(),
                style: Theme.of(context).primaryTextTheme.bodyText2),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text("Add to Favorite"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    cart.addItem(loadedProduct.id, loadedProduct.price,
                        loadedProduct.title);
                  },
                  child: Row(
                    children: const [
                      Text("Add to Cart"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Consumer<Product>(
//                   builder: (ctx, product, _) => IconButton(
//                     onPressed: () {
//                       product.toggleFavoriteStatus();
//                     },
//                     icon: Icon(product.isFavorite
//                         ? Icons.favorite
//                         : Icons.favorite_border),
//                     color: Theme.of(context).colorScheme.secondary,
//                   ),
//                 ),