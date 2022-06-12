import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_shoes/widgets/cart_circle_counter_widget.dart';

import '../screens/cart_screen.dart';

class CartAppBarItemWidget extends StatelessWidget {
  const CartAppBarItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          icon: Image.asset(
            'assets/icons/shopping-cart-grey.png',
            color: Colors.white,
          ),
        ),
        CartCircleCounterWidget(),
      ],
    );
  }
}
