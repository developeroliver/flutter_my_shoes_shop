import 'package:flutter/material.dart';
import 'package:my_shoes/constants/color.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sneakers Category",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  "Product name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  "120€",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
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
                          Row(
                            children: [
                              Expanded(
                                child: Text("En stock"),
                              ),
                              Expanded(
                                child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text(
                                      "tailles",
                                      style: TextStyle(
                                        color: kTextColor,
                                      ),
                                    ),
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
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
                          ),
                          SizedBox(height: 20),
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
                                flex: 8,
                                child: ElevatedButton(
                                  onPressed: () => print('Ajouter au panier'),
                                  child: Text(
                                    "Ajouter au panier",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    primary: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: (constraints.maxHeight * 0.6) * 0.4,
                    left: constraints.maxWidth * 0.35,
                    child: Image.asset('assets/images/black-shoe.png',
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
