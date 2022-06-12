import 'package:flutter/material.dart';
import 'package:my_shoes/utils/extensions.dart';

import '../models/product.dart';
import '../screens/product_details_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final List<Product> _products;
  final int index;
  const ProductCardWidget(
      {Key? key, required List<Product> products, required this.index})
      : _products = products,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                          product: _products[index],
                        )));
          },
          child: Container(
            height: 180,
            width: 180,
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
        Text(_products[index].price.displayPriceInEuros()),
      ],
    );
  }
}
