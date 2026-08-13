import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class UAppBarTheme {
  UAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: UColors.black, size: USizes.iconMd),
    actionsIconTheme: IconThemeData(color: UColors.black, size: USizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: UColors.black,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: UColors.white, size: USizes.iconMd),
    actionsIconTheme: IconThemeData(color: UColors.white, size: USizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: UColors.white,
    ),
  );
}
