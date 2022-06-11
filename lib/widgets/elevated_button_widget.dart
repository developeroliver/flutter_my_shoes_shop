import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  const ElevatedButtonWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print('Ajouter au panier'),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: Colors.black,
      ),
    );
  }
}
