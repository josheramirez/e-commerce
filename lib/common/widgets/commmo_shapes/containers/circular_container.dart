import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer(
      {super.key,
      this.height = 400,
      this.width = 400,
      this.backgroundColor = UColors.white,
      this.padding = 0,
      this.margin,
      this.child});

  final double height, width, padding;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}