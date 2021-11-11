import 'package:flutter/material.dart';
import 'package:shop_me/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
}
