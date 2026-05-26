import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/items.dart';
import 'package:e_commerce_app/model/cartmodel.dart';
import 'package:e_commerce_app/view/cart_screen.dart';
import 'package:e_commerce_app/view/homescreen.dart';
import 'package:e_commerce_app/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mybuyscreen extends StatelessWidget {
  const Mybuyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryOrange = Color(
      0xFFFF6D00,
    ); // Vibrant Neon Orange for CTA
    const Color secondaryAmber = Color(
      0xFFFFAB40,
    ); // Lighter Amber for highlights
    const Color offWhite = Color(0xFFF8F9FA); // Easy-on-the-eyes text
    const Color darkSurface = Color(0xFF1E1E1E); // Elevated Card Grey
    final cartlist = context.watch<Cartprovider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Buy now",
          style: const TextStyle(color: offWhite, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: cartlist.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      "No items in the cart, go back to cart",
                      textAlign: .center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 80, 80, 80),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: .center,

                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkSurface,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Go to home",
                              style: TextStyle(
                                color: secondaryAmber,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartlist.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartlist.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(item.product.image, width: 60),

                          title: Text(
                            item.product.name,
                            style: TextStyle(color: offWhite),
                          ),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹${item.product.price}",
                                style: TextStyle(color: secondaryAmber),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "Quantity: ${item.quantity}",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              IconButton(
                                onPressed: () {
                                  cartlist.removeFromCart(item.product);
                                },

                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: .center,

                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkSurface,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Shop more",
                            style: TextStyle(color: secondaryAmber),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),

                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryOrange,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Order Placed Successfully."),
                              ),
                            );
                          },
                          child: Text(
                            "Order now",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
