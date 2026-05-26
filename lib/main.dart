import 'package:e_commerce_app/controller/cartprovider.dart';
import 'package:e_commerce_app/controller/wishlistprovider.dart';
import 'package:e_commerce_app/view/homescreen.dart';
import 'package:e_commerce_app/view/navbar.dart';
import 'package:e_commerce_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cartprovider()),
        ChangeNotifierProvider(create: (context) => Wishlistprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
