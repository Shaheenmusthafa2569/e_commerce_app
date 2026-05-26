import 'package:e_commerce_app/model/cartmodel.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class Cartprovider extends ChangeNotifier {
  List<Cartmodel> cartItems = [];

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(Cartmodel(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
