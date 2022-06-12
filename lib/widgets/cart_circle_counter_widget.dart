import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shoes/providers/cart_provider.dart';

class CartCircleCounterWidget extends StatelessWidget {
  const CartCircleCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);

    return _cartProvider.products.length > 0
        ? Positioned(
            left: 20,
            top: 20,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                _cartProvider.products.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        : Container();
  }
}
