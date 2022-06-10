import 'package:flutter/material.dart';

import 'package:my_shoes/screens/product_details_screen.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => print('boutton menu'),
          icon: Image.asset(
            'assets/icons/menu.png',
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('Ajout panier'),
            icon: Image.asset(
              'assets/icons/shopping-cart-grey.png',
              color: Colors.black,
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen()));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: _products[index].backgroundcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          _products[index].image,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(_products[index].title),
                  ),
                  Text(_products[index].price.toStringAsFixed(0) + ' €'),
                ],
              ),
            );
          }),
    );
  }
}
