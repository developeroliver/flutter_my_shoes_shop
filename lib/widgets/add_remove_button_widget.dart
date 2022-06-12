// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AddRemoveButtonWidget extends StatelessWidget {
  final VoidCallback pressedPlusButton;
  final VoidCallback pressedLessButton;
  final String numberOfItemToDisplay;
  AddRemoveButtonWidget({
    Key? key,
    required this.pressedPlusButton,
    required this.pressedLessButton,
    required this.numberOfItemToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              padding: EdgeInsets.all(1),
              icon: Icon(
                Icons.remove,
                size: 10,
                color: Colors.black,
              ),
              onPressed: () {
                pressedLessButton();
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            numberOfItemToDisplay,
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
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.add,
                size: 10,
                color: Colors.black,
              ),
              onPressed: () {
                pressedPlusButton();
              },
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
