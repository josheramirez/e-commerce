import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage(
    {
      super.key, 
      this.fit = BoxFit.cover, 
      required this.image, 
      this.isNetworkImage = false, 
      this.overlayColor, 
      this.backgroundColor,
      this.width = 56,  
      this.height = 56,
      this.padding = USizes.sm
      });

    final BoxFit? fit;
    final String image;
    final bool isNetworkImage;
    final Color? overlayColor;
    final Color? backgroundColor;
    final double width, height, padding ;
    
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100)
        ),
      child: Image(
        image: isNetworkImage? NetworkImage(image) : AssetImage(image) as ImageProvider,
        // color: Colors.black,
      ),
    );
  }
}