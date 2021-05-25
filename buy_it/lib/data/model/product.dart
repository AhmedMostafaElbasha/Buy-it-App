import 'package:flutter/foundation.dart';

class Product {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String productCategory;
  final String productImagePath;

  Product({
    @required this.productName,
    @required this.productPrice,
    @required this.productDescription,
    @required this.productCategory,
    @required this.productImagePath,
  });
}
