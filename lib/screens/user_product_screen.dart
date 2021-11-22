import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_me/providers/product.dart';
import 'package:shop_me/providers/products_provider.dart';
import 'package:shop_me/screens/drawer_screen.dart';
import 'package:shop_me/screens/edit_product_screen.dart';
import 'package:shop_me/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const id = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.id);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                title: productData.items[i].title,
                imageUrl: productData.items[i].imageUrl,
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
