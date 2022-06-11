import 'package:flutter/material.dart';

import '../models/product.dart';

class TitleProductWidget extends StatelessWidget {
  final String title;
  const TitleProductWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Colors.white,
          ),
    );
  }
}
