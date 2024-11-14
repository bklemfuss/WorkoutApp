import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import your HomeScreen widget

void main() {
  runApp(MyApp());
  //test
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Set your HomeScreen as the home screen
    );
  }
}
