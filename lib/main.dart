import 'package:bloc_pattern/screens/CartScreen.dart';
import 'package:bloc_pattern/screens/productListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
      "/":(BuildContext context)=>ProductListScreen(),
      "/cart":(BuildContext context)=>CartScreen()
    },
      initialRoute: "/",
    );
  }
}

