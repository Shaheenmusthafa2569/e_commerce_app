import 'package:e_commerce_app/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplash extends StatelessWidget {
  const MySplash({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryOrange = Color(
      0xFFFF6D00,
    ); // Vibrant Neon Orange for CTA
    const Color secondaryAmber = Color(0xFFFFAB40);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
          
          Lottie.asset("assets/Books.json")
          
          ,
            Text("The Quiet Shelf", style: TextStyle(color: primaryOrange)),
          ],
        ),
      ),
    );
  }
}
