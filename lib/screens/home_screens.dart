import 'package:flutter/material.dart';

import 'package:my_shoes/widgets/product_card_widget.dart';

import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _products = Product.products;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'My Shoes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => print('boutton menu'),
          icon: Image.asset(
            'assets/icons/menu.png',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('Ajout panier'),
            icon: Image.asset(
              'assets/icons/shopping-cart-grey.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ProductCardWidget(
                products: _products,
                index: index,
              ),
            );
          }),
    );
  }
}
