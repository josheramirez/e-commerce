
import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UCustomRounderEdges(),
      child: Container(
        height: UDeviceHelper.getScreenHeight(context) * 0.4,
        color: UColors.primary,
        child: Stack(
          children: [
            Container(
              height: UDeviceHelper.getScreenHeight(context) * 0.4,
              color: UColors.primary,
              child: Stack(
                children: [
                  // Circular Container
                  Positioned(
                    top: -150,
                    right: -160,
                    child: UCircularContainer(
                      height: UDeviceHelper.getScreenHeight(context) * 0.4,
                      width: UDeviceHelper.getScreenHeight(context) * 0.4,
                      backgroundColor: UColors.white.withValues(alpha: 0.1),
                    ),
                  ),

                  // Circular Container
                  Positioned(
                    top: 50,
                    right: -250,
                    child: UCircularContainer(
                      height: UDeviceHelper.getScreenHeight(context) * 0.4,
                      width: UDeviceHelper.getScreenHeight(context) * 0.4,
                      backgroundColor: UColors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  
                  // 
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UCustomRounderEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // VERSION WITH CURVES UP

    // // Top To Bottom Line
    // path.lineTo(0, size.height - 40);

    // // First Curve
    // Offset firstPointCurve = Offset(40, size.height);
    // Offset secondPointCurve = Offset(size.width / 2, size.height);

    // path.quadraticBezierTo(
    //   // point of control
    //   firstPointCurve.dx,
    //   firstPointCurve.dy,
    //   // final point of curve dx,dy
    //   secondPointCurve.dx,
    //   secondPointCurve.dy,
    // );

    // // Second Curve
    // Offset firstPointCurve2 = Offset(size.width - 40, size.height);
    // Offset secondPointCurve2 = Offset(size.width, size.height - 40);

    // path.quadraticBezierTo(
    //   firstPointCurve2.dx,
    //   firstPointCurve2.dy,
    //   secondPointCurve2.dx,
    //   secondPointCurve2.dy,
    // );
// VERSION WITH CURVES UP

// VERSION WITH CURVE DOWN

    // Top To Bottom Line
    path.lineTo(0, size.height);

    // First Curve
    Offset firstPointCurve = Offset(0, size.height-20);
    Offset secondPointCurve = Offset(20, size.height-20);

    path.quadraticBezierTo(
      // point of control
      firstPointCurve.dx,
      firstPointCurve.dy,
      // final point of curve dx,dy
      secondPointCurve.dx,
      secondPointCurve.dy,
    );

    // Second Curve is a rect line
    Offset firstPointCurve2 = Offset(0, size.height-20);
    Offset secondPointCurve2 = Offset(size.width-20, size.height - 20);

    path.quadraticBezierTo(
      firstPointCurve2.dx,
      firstPointCurve2.dy,
      secondPointCurve2.dx,
      secondPointCurve2.dy,
    );

    // Thrid Curve

    Offset thirdFirstPointCurve = Offset(size.width, size.height-20);
    Offset thirdsecondPointCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(
      thirdFirstPointCurve.dx,
      thirdFirstPointCurve.dy,
      thirdsecondPointCurve.dx,
      thirdsecondPointCurve.dy,
    );
// VERSION WITH CURVE DOWN


    // Bottom To Top Line
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
