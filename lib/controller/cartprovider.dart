import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class Cartprovider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  void addToCart(ProductModel product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }
}
