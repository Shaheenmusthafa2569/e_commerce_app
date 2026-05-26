import 'package:e_commerce_app/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {

  bool visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {

      setState(() {

        visible = true;
      });
    });

    Future.delayed(Duration(seconds: 4), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    const Color primaryOrange = Color(0xFFFF6D00);

    return Scaffold(

      backgroundColor: Colors.black,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(

              "The Quiet Shelf",

              style: GoogleFonts.interTight(

                color: primaryOrange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Lottie.asset(
              "assets/Books.json",

              fit: BoxFit.cover,
              height: 150,
            ),

            AnimatedOpacity(

              opacity: visible ? 1 : 0,

              duration: Duration(seconds: 2),

              child: Text(

                "Discover Your Next Book",

                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 