import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key, 
    this.width, 
    this.height, 
    required this.imageUrl, 
    this.applyImageRadius = true, 
    this.border, 
    this.backgroundColor = UColors.light, 
    this.fit = BoxFit.contain, 
    this.padding, 
    this.onPressed, 
    this.borderRadius = USizes.md, 
    this.isNetworkImage = true,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,

      decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: ClipRRect(
        borderRadius: applyImageRadius? BorderRadius.circular(borderRadius) : BorderRadius.zero,
        child: Image(image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider ,fit: fit),
      ),
    );
  }
}
