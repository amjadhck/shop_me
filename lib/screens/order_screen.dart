import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_me/providers/orders.dart';
import 'package:shop_me/widgets/order_item.dart';

import 'drawer_screen.dart';

class OrderScreen extends StatelessWidget {
  static const id = '\order-screen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Your Orders"),
      ),
      drawer: DrawerScreen(),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItems(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
