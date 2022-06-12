import 'package:flutter/material.dart';
import 'package:my_shoes/providers/cart_provider.dart';
import 'package:my_shoes/screens/home_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: const HomeScreen(title: 'My Shoes'),
      ),
    );
  }
}
