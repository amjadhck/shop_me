import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/providers/orders.dart';
import 'package:shop_me/screens/order_screen.dart';
import 'package:shop_me/widgets/badge.dart';
import 'package:shop_me/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const id = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartShort = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        actions: [
          Consumer<Cart>(
              builder: (_, cart, child) => Badge(
                    child: child!,
                    value: cart.quantityCount.toString(),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              )),
          const SizedBox(
            width: 10,
          ),
          Consumer<Orders>(
              builder: (_, order, child) => Badge(
                    child: child!,
                    value: order.itemCount.toString(),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              child: IconButton(
                icon: const Icon(Icons.payment),
                onPressed: () {
                  Navigator.of(context).pushNamed(OrderScreen.id);
                },
              )),
          const SizedBox(
            width: 10,
          ),

          // IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(OrderScreen.id);
          //     },
          //     icon: const Icon(Icons.payment))
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                      child: const Text("Add to Orders"))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartScreenItem(
                id: cartShort[index].id,
                title: cartShort[index].title,
                price: cartShort[index].price,
                quantity: cartShort[index].quantity,
                productID: cart.items.keys.toList()[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
