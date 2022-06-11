import 'package:flutter/material.dart';

class SubtitleProductWidget extends StatelessWidget {
  final String subtitle;
  const SubtitleProductWidget({Key? key, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(color: Colors.white, fontSize: 17),
    );
  }
}
