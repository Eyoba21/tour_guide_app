import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/view/widgets/big_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  String? text;
  double? width;
  bool? isResponsive;
  ResponsiveButton({super.key, this.width, this.isResponsive, this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: isResponsive == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: 'Book Trip Now',
                            size: 15,
                            color: AppColors.white,
                          ),
                          Image.asset("assets/button-one.png")
                        ],
                      )
                    : Image.asset("assets/button-one.png")),
          ],
        ),
      ),
    );
  }
}
