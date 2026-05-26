import 'package:e_commerce_app/view/cart_screen.dart';
import 'package:e_commerce_app/view/homescreen.dart';
import 'package:e_commerce_app/view/wishlistscreen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    MyHomePage(),
    Mycartscreen(),
    myWishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: screens[currentIndex],

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),

          child: BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            backgroundColor: Colors.black,

            selectedItemColor: Colors.orange,

            unselectedItemColor: Colors.white54,

            type: BottomNavigationBarType.fixed,

            elevation: 0,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart_rounded),
                label: "Cart",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: "Wishlist",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
