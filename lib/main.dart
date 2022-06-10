import 'package:flutter/material.dart';
import 'package:my_shoes/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      home: const HomeScreen(title: 'My Shoes'),
    );
  }
}
