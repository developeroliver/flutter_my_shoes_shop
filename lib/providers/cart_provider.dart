import 'package:flutter/cupertino.dart';

import '../models/product.dart';

enum ChangeQuantity {
  ADD,
  REMOVE,
}

class CartProvider with ChangeNotifier {
  Map<String, Product> _products = {};

  Map<String, Product> get products {
    return {..._products}; //to not return a pointer
  }

  double get productsAmount {
    double amount = 0.0;
    _products.forEach((key, value) {
      amount += value.amountInCartForSameProduct;
    });
    return amount;
  }

  double productAmount(Product product) {
    double amount = 0.0;
    amount = _products[product.id.toString()]?.amountInCartForSameProduct ?? 0;

    return amount;
  }

  int productQuantity(Product product) {
    int numberInCart = 1;
    numberInCart = _products[product.id.toString()]?.numberInCart ?? 1;
    return numberInCart;
  }

  void addProduct(Product product, int quantity) {
    if (_products.containsKey(product.id.toString)) {
      _products[product.id.toString()]?.numberInCart += quantity;
    } else {
      _products.putIfAbsent(product.id.toString(), () => product);
      _products[product.id.toString()]?.numberInCart += quantity - 1;
    }
    notifyListeners();
  }

  void changeProductQuantity(Product product, ChangeQuantity changeQuantity) {
    if (_products.containsKey(product.id.toString())) {
      if (changeQuantity == ChangeQuantity.ADD) {
        _products[product.id.toString()]?.numberInCart++;
      } else {
        if (product.numberInCart > 1) {
          _products[product.id.toString()]?.numberInCart--;
        }
      }
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.removeWhere((key, value) => key == product.id.toString());
    notifyListeners();
  }
}
