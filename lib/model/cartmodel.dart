import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  final ProductModel product;
  int quantity;

  Cartmodel({required this.product, this.quantity = 1});
}
