import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class UChipTheme {
  // private constructor
  UChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: UColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: UColors.black),
    selectedColor: UColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: UColors.darkerGrey,
    labelStyle: TextStyle(color: UColors.white),
    selectedColor: UColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UColors.white,
  );
}
