import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_me/providers/products_provider.dart';
import 'package:shop_me/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showfavs;

  const ProductGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = showfavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        //create: (context) => products[index], //remove.value
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
    );
  }
}
