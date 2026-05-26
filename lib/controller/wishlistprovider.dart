import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class Wishlistprovider extends ChangeNotifier {
  List<ProductModel> wishlistItems = [];

  void toggleWishlist(ProductModel product) {
    if (wishlistItems.contains(product)) {
      wishlistItems.remove(product);
    } else {
      wishlistItems.add(product);
    }
    notifyListeners();
  }


}
