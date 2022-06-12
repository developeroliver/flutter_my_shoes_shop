import 'package:flutter/material.dart';
import 'package:my_shoes/widgets/cart_app_bar_item_widget.dart';

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
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/menu.png',
            color: Colors.white,
          ),
        ),
        actions: [
          CartAppBarItemWidget(),
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
