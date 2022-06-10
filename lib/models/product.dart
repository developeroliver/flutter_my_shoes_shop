// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final Color backgroundcolor;
  final double price;
  Product(
    this.title,
    this.description,
    this.image,
    this.backgroundcolor,
    this.price,
  );

  static List<Product> products = [
    Product(
      'Red shoes',
      loremIpsum,
      'assets/images/red-shoe.png',
      Color(0xffb8636f),
      123,
    ),
    Product(
      'Black shoes',
      loremIpsum,
      'assets/images/black-shoe.png',
      Color(0xff989796),
      87,
    ),
    Product(
      'Blue shoes',
      loremIpsum,
      'assets/images/blue-shoe.png',
      Color(0xff5c8ab0),
      152,
    ),
    Product(
      'Orange shoes',
      loremIpsum,
      'assets/images/orange-shoe.png',
      Color(0xffc1a78e),
      99,
    ),
    Product(
      'B/W shoes',
      loremIpsum,
      'assets/images/black-and-white-shoe.png',
      Color(0xff989796),
      89,
    ),
    Product(
      'Turquoise shoes',
      loremIpsum,
      'assets/images/turquoise-shoe.png',
      Color(0xff79c6c1),
      145,
    ),
  ];
}

String loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
