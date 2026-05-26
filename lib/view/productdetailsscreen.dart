import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/controller/wishlistprovider.dart';
import 'package:e_commerce_app/items.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/homescreen.dart';
import 'package:e_commerce_app/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productdetailsscreen extends StatefulWidget {
  final ProductModel product;

  const Productdetailsscreen({super.key, required this.product});

  @override
  State<Productdetailsscreen> createState() => _ProductdetailsscreenState();
}

class _ProductdetailsscreenState extends State<Productdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    // Theme Palette Configurations
    const Color primaryOrange = Color(
      0xFFFF6D00,
    ); // Vibrant Neon Orange for CTA
    const Color secondaryAmber = Color(
      0xFFFFAB40,
    ); // Lighter Amber for highlights
    const Color offWhite = Color(0xFFF8F9FA); // Easy-on-the-eyes text
    const Color darkSurface = Color(0xFF1E1E1E); // Elevated Card Grey
    final cartlist = context.read<Cartprovider>();

    final wishlistprovider = context.watch<Wishlistprovider>();
    final item = widget.product;

    final isWishlisted = wishlistprovider.wishlistItems.contains(item);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Using Navigator.pop keeps your page stack healthy
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ), // Styled back button
          color: offWhite,
        ),
        centerTitle: true,
        title: Text(
          widget.product.name,
          style: const TextStyle(color: offWhite, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                width: double.infinity,
                child: Card(
                  color: darkSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.contain,
                      ), // Fixed stretch issues
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: offWhite,
                ),
              ),
              const SizedBox(height: 6),

              Text(
                "₹${widget.product.price}",
                style: const TextStyle(
                  color: secondaryAmber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryOrange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        cartlist.addToCart(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Added ${widget.product.name} to the Cart",
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      wishlistprovider.toggleWishlist(item);
                      isWishlisted
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Added ${widget.product.name} to the Wishlist",
                                ),
                              ),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "removed ${widget.product.name} from the Wishlist",
                                ),
                              ),
                            );
                    },
                    icon: isWishlisted
                        ? Icon(Icons.favorite, color: primaryOrange, size: 28)
                        : Icon(
                            Icons.favorite_border,
                            color: primaryOrange,
                            size: 28,
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                "About this item",
                style: TextStyle(
                  color: secondaryAmber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
