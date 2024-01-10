import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/view/widgets/big_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final double size;
  final Color bgColor;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool isIcon;
  CustomButton({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.size,
    required this.color,
    this.text = "hi",
    this.icon,
    this.isIcon = false,
  });

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isIcon == false
          ? Center(
              child: BigText(
                text: text!,
                color: AppColors.black,
                size: 20,
              ),
            )
          : Center(child: Icon(icon)),
    );
  }
}
