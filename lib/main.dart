// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_me/providers/products_provider.dart';
import 'package:shop_me/screens/product_detail_screen.dart';
import 'package:shop_me/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      // builder: (context),
      child: MaterialApp(
        title: 'shopMe',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        home: ProductOverviwScreen(),
        routes: {
          ProductDetailScreen.id: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
