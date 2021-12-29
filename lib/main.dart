// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/providers/orders.dart';
import 'package:shop_me/providers/products_provider.dart';
import 'package:shop_me/screens/cart_screen.dart';
import 'package:shop_me/screens/edit_product_screen.dart';
import 'package:shop_me/screens/login_screen.dart';
import 'package:shop_me/screens/order_screen.dart';
import 'package:shop_me/screens/product_detail_screen.dart';
import 'package:shop_me/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_me/screens/spalsh.dart';
import 'package:shop_me/screens/user_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'shopMe',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 20,
              ),
              button: TextStyle(
                color: Colors.black,
                fontSize: 35,
              )),
          fontFamily: 'Lato',
        ),
        // home: ProductOverviwScreen(),
        home: SplashScreen(),
        routes: {
          ProductDetailScreen.id: (context) => ProductDetailScreen(),
          CartScreen.id: (context) => CartScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ProductOverviwScreen.id: (context) => ProductOverviwScreen(),
          OrderScreen.id: (context) => OrderScreen(),
          UserProductScreen.id: (context) => UserProductScreen(),
          EditProductScreen.id: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
