import 'package:flutter/material.dart';
import 'package:my_shoes/constants/color.dart';
import 'package:my_shoes/widgets/elevated_button_widget.dart';
import 'package:my_shoes/widgets/subtitle_product_widget.dart';
import 'package:my_shoes/widgets/title_product_widget.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double appBarHeight = AppBar().preferredSize.height;
    double screenPadding = MediaQuery.of(context).padding.top;
    double screenHeight = (screenSize.height - appBarHeight) - screenPadding;

    return Scaffold(
      backgroundColor: widget.product.backgroundcolor,
      appBar: AppBar(
        backgroundColor: widget.product.backgroundcolor,
        elevation: 0,
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
                                SubtitleProductWidget(subtitle: "Prix"),
                                TitleProductWidget(
                                  title:
                                      widget.product.price.toStringAsFixed(0) +
                                          " €",
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
                                child: Text("En stock"),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text(
                                        "tailles",
                                        style: TextStyle(
                                          color: kTextColor,
                                        ),
                                      ),
                                      value: "36",
                                      underline: Container(),
                                      items: [
                                        DropdownMenuItem(
                                          value: "36",
                                          child: Text("36"),
                                        ),
                                        DropdownMenuItem(
                                          value: "37",
                                          child: Text("37"),
                                        ),
                                      ],
                                      onChanged: (value) {}),
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
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                    onPressed: () => print('supprimer'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.add, size: 15),
                                    onPressed: () => print('supprimer'),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                  flex: 7,
                                  child: ElevatedButtonWidget(
                                    title: 'Ajouter au panier',
                                  )),
                            ],
                          ),
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
