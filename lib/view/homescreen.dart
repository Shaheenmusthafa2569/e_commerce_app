import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/controller/wishlistprovider.dart';
import 'package:e_commerce_app/items.dart';
import 'package:e_commerce_app/view/productdetailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Defining Palette Hex Values for reuse
  static const Color primaryOrange = Color(
    0xFFFF6D00,
  ); // Vibrant Neon Orange for CTA
  static const Color secondaryAmber = Color(
    0xFFFFAB40,
  ); // Lighter Amber for highlights
  static const Color offWhite = Color(0xFFF8F9FA); // Easy-on-the-eyes text
  static const Color darkSurface = Color(0xFF1E1E1E); // Elevated Card Grey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Pure OLED Black
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          "E-Commerce App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: offWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final cartlist = context.read<Cartprovider>();
            final wishlistprovider = context.watch<Wishlistprovider>();
            final item = items[index];
            final isWishlisted = wishlistprovider.wishlistItems.contains(item);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Productdetailsscreen(product: item),
                  ),
                );
              },
              child: Card(
                color:
                    darkSurface, // Replaced white12 with a solid dark surface
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(item.image, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: offWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "₹${item.price}",
                          style: const TextStyle(
                            color: secondaryAmber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    primaryOrange, // Vivid CTA Button
                                foregroundColor: Colors
                                    .black, // High contrast black text on orange
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                cartlist.addToCart(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${item.name} added to cart"),
                                  ),
                                );
                              },
                              child: const Text(
                                "Add",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              wishlistprovider.toggleWishlist(item);
                            },
                            icon: Icon(
                              isWishlisted
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: primaryOrange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
