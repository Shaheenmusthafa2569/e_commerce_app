import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mycartscreen extends StatefulWidget {
  const Mycartscreen({super.key});

  @override
  State<Mycartscreen> createState() => _MycartscreenState();
}

class _MycartscreenState extends State<Mycartscreen> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
          style: const TextStyle(color: offWhite, fontWeight: FontWeight.w600),
        ),
      ),
      body: cartlist.cartItems.isEmpty
          ? Center(
              child: Text(
                "No books in cart",
                style: TextStyle(color: offWhite),
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
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Card(
                          color: darkSurface,
                          child: ListTile(
                            leading: Image.network(
                              item.product.image,
                              width: 60,
                            ),

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
                                    cartlist.decreaseQuantity(item.product);
                                  },

                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),

                                Text(
                                  "${item.quantity}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    cartlist.increaseQuantity(item.product);
                                  },

                                  icon: Icon(
                                    Icons.add_circle,
                                    color: primaryOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Buy Now", style: TextStyle(color: darkSurface)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
