import 'package:flutter/material.dart';
import 'package:online_shopping_app/screens/home_page.dart';






void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}



