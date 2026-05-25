import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productdetailsscreen extends StatelessWidget {
  final ProductModel product;

  Productdetailsscreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.network(product.image),

          SizedBox(height: 20),

          Text(
            product.name,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          Text("₹${product.price}"),

          SizedBox(height: 10),

          Text(product.description),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              context.read<Cartprovider>().addToCart(product);
            },

            child: Text("Add To Cart"),
          ),
        ],
      ),
    );
  }
}
