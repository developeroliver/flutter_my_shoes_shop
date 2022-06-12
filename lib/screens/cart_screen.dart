import 'package:flutter/material.dart';
import 'package:my_shoes/constants/color.dart';
import 'package:my_shoes/models/product.dart';
import 'package:my_shoes/utils/extensions.dart';
import 'package:my_shoes/widgets/add_remove_button_widget.dart';
import 'package:my_shoes/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    final _cartMap = _cartProvider.products;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: kTextColor),
        title: Text(
          'My Shoes panier',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: _cartProvider.products.length > 0
                  ? ListView.separated(
                      itemCount: _cartMap.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        Product _currentProduct =
                            _cartMap.values.elementAt(index);
                        return Dismissible(
                          key: GlobalKey(),
                          direction: DismissDirection.endToStart,
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          onDismissed: (direction) {
                            _cartProvider.removeProduct(_currentProduct);
                          },
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              leading: Image.asset(
                                _currentProduct.image,
                                height: 200,
                              ),
                              title: Text(_currentProduct.title),
                              subtitle: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text("Sneakers Category"),
                              ),
                              trailing: SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: AddRemoveButtonWidget(
                                        numberOfItemToDisplay: _cartProvider
                                            .productQuantity(_currentProduct)
                                            .toString(),
                                        pressedPlusButton: () =>
                                            _cartProvider.changeProductQuantity(
                                                _currentProduct,
                                                ChangeQuantity.ADD),
                                        pressedLessButton: () =>
                                            _cartProvider.changeProductQuantity(
                                                _currentProduct,
                                                ChangeQuantity.REMOVE),
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        _cartProvider
                                            .productAmount(_currentProduct)
                                            .displayPriceInEuros(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        Strings.cartNoItem,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(2, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.vatText,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            ((_cartProvider.productsAmount) * 0.2)
                                .displayPriceInEuros(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.vatTextNotIncluded,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _cartProvider.productsAmount.displayPriceInEuros(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButtonWidget(
                              onClickCallBack: () {},
                              title: Strings.checkoutButton,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
