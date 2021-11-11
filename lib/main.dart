// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_me/screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shopMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductOverviwScreen(),
    );
  }
}
