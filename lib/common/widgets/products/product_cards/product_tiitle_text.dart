import 'package:flutter/material.dart';

class ProductTiitleText extends StatelessWidget {
  const ProductTiitleText({super.key, required this.title, this.smallSize = false, this.maxLines = 2, this.textAlign});

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize? Theme.of(context).textTheme.labelLarge : TextStyle(
    fontSize: 16.0,
    height: 1.2, // 1.5 times the font size
  ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}