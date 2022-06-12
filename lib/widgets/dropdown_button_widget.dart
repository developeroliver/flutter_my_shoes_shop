import 'package:flutter/material.dart';

import '../constants/color.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String _currentSize = "36";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        hint: Text(
          "tailles",
          style: TextStyle(
            color: kTextColor,
          ),
        ),
        value: _currentSize,
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
          DropdownMenuItem(
            value: "38",
            child: Text("38"),
          ),
          DropdownMenuItem(
            value: "39",
            child: Text("39"),
          ),
          DropdownMenuItem(
            value: "40",
            child: Text("40"),
          ),
          DropdownMenuItem(
            value: "41",
            child: Text("41"),
          ),
          DropdownMenuItem(
            value: "42",
            child: Text("42"),
          ),
          DropdownMenuItem(
            value: "43",
            child: Text("43"),
          ),
          DropdownMenuItem(
            value: "44",
            child: Text("44"),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _currentSize = value.toString();
          });
        });
  }
}
