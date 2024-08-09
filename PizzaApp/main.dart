import 'package:vizza/models/cart.dart';
import 'package:vizza/pages/cart_page.dart';
import 'package:vizza/pages/home_page.dart';
import 'package:vizza/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vizza/pages/shop_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage(),
        '/shop_page': (context)=> const ShopPage(),
      },
    );
  }
}
