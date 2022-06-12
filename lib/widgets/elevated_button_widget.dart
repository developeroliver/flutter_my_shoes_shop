import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClickCallBack;
  const ElevatedButtonWidget(
      {Key? key, required this.title, required this.onClickCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClickCallBack,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPrimary: Colors.white,
        primary: Colors.black,
      ),
    );
  }
}
