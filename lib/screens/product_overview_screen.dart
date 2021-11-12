import 'package:flutter/material.dart';

import 'package:shop_me/widgets/product_grid.dart';

class ProductOverviwScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shopMe'),
      ),
      body: ProductGrid(),
    );
  }
}
