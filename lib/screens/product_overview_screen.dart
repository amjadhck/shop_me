// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/screens/cart_screen.dart';
import 'package:shop_me/screens/drawer_screen.dart';
import 'package:shop_me/screens/login_screen.dart';
import 'package:shop_me/widgets/badge.dart';

import 'package:shop_me/widgets/product_grid.dart';

enum FilterOption { Favorite, All, Logout }

class ProductOverviwScreen extends StatefulWidget {
  static const id = '/overview-screen';
  @override
  State<ProductOverviwScreen> createState() => _ProductOverviwScreenState();
}

class _ProductOverviwScreenState extends State<ProductOverviwScreen> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
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
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorite) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show Favorite"),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOption.All,
              ),
              PopupMenuItem(
                child: Text("Logout"),
                value: FilterOption.Logout,
                onTap: () {
                  logout(context);
                },
              ),
            ],
          ),
        ],
        title: const Text('shopMe'),
        centerTitle: true,
      ),
      drawer: DrawerScreen(),
      body: ProductGrid(_showOnlyFav),
    );
  }
}

void logout(BuildContext context) async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  await _sharedPrefs.clear();

  WidgetsBinding.instance!.addPostFrameCallback((_) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
  });
}
