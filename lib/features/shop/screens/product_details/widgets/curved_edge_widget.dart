import 'package:e_commerce/features/shop/screens/home/widgets/custom_rounder_edges.dart';
import 'package:flutter/material.dart';

class UCurvedEdgeWidget extends StatelessWidget {
  const UCurvedEdgeWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UCustomRounderEdges(),
      child: child,
    );
  }
}