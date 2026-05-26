import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/controller/wishlistprovider.dart';
import 'package:e_commerce_app/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myWishlistScreen extends StatefulWidget {
  const myWishlistScreen({super.key});

  @override
  State<myWishlistScreen> createState() => _myWishlistScreenState();
}

class _myWishlistScreenState extends State<myWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistprovider = context.watch<Wishlistprovider>();

    // Theme Palette Configurations
    const Color primaryOrange = Color(
      0xFFFF6D00,
    ); // Vibrant Neon Orange for CTA
    const Color secondaryAmber = Color(
      0xFFFFAB40,
    ); // Lighter Amber for highlights
    const Color offWhite = Color(0xFFF8F9FA); // Easy-on-the-eyes text
    const Color darkSurface = Color(0xFF1E1E1E); // Elevated Card Grey

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Wishlist",
          style: const TextStyle(color: offWhite, fontWeight: FontWeight.w600),
        ),
      ),
      body: wishlistprovider.wishlistItems.isEmpty
          ? Center(
              child: Text(
                "No Wishlist items",
                textAlign: .center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 80, 80, 80),
                  fontSize: 25,
                ),
              ),
            )
          : ListView.builder(
              itemCount: wishlistprovider.wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistprovider.wishlistItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    color: darkSurface,
                    child: ListTile(
                      leading: Image.network(item.image, width: 60),
                      title: Text(item.name, style: TextStyle(color: offWhite)),

                      subtitle: Text(
                        "₹${item.price}",
                        style: TextStyle(color: secondaryAmber),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<Cartprovider>().addToCart(item);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${item.name} added to cart"),
                                ),
                              );
                            },

                            icon: Icon(
                              Icons.shopping_cart_checkout,
                              color: primaryOrange,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              wishlistprovider.toggleWishlist(item);
                            },

                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
