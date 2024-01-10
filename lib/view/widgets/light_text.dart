import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LightText extends StatelessWidget {
  String text;
  Color color;
  double size;

  LightText(
      {super.key,
      this.color = Colors.black54,
      this.size = 30,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
