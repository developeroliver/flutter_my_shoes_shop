import 'package:flutter/material.dart';
import 'package:my_shoes/providers/cart_provider.dart';
import 'package:my_shoes/utils/extensions.dart';
import 'package:my_shoes/widgets/add_remove_button_widget.dart';
import 'package:my_shoes/widgets/dropdown_button_widget.dart';
import 'package:my_shoes/widgets/subtitle_product_widget.dart';
import 'package:my_shoes/widgets/title_product_widget.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../models/product.dart';
import '../widgets/cart_app_bar_item_widget.dart';
import '../widgets/elevated_button_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double appBarHeight = AppBar().preferredSize.height;
    double screenPadding = MediaQuery.of(context).padding.top;
    double screenHeight = (screenSize.height - appBarHeight) - screenPadding;

    final _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: widget.product.backgroundcolor,
      appBar: AppBar(
        backgroundColor: widget.product.backgroundcolor,
        elevation: 0,
        actions: [
          CartAppBarItemWidget(),
        ],
      ),
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: constraints.maxHeight * 0.35,
                      width: constraints.maxWidth,
                      color: widget.product.backgroundcolor,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubtitleProductWidget(
                                    subtitle: "Sneakers Categorry"),
                                TitleProductWidget(
                                  title: widget.product.title,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubtitleProductWidget(subtitle: Strings.price),
                                TitleProductWidget(
                                  title: widget.product.price
                                      .displayPriceInEuros(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 70.0),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(Strings.available),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: DropdownButtonWidget(),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Expanded(
                            flex: 6,
                            child: Text(widget.product.description),
                          ),
                          Spacer(),
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: AddRemoveButtonWidget(
                                      numberOfItemToDisplay:
                                          _productQuantity.toString(),
                                      pressedLessButton: () {
                                        setState(() {
                                          if (_productQuantity > 1) {
                                            _productQuantity--;
                                          }
                                        });
                                      },
                                      pressedPlusButton: () {
                                        setState(() {
                                          _productQuantity++;
                                        });
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 8,
                                    child: ElevatedButtonWidget(
                                      onClickCallBack: () {
                                        Product product = widget.product;
                                        _cartProvider.addProduct(
                                            product, _productQuantity);
                                      },
                                      title: Strings.addToCart,
                                    ),
                                  ),
                                ],
                              )),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: (constraints.maxHeight * 0.6) * 0.4,
                    left: constraints.maxWidth * 0.35,
                    child: Image.asset(widget.product.image,
                        width: constraints.maxWidth / 2),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
