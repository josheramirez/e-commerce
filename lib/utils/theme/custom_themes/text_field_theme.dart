import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class UTextFormFieldTheme {
  UTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: UColors.darkGrey,
    suffixIconColor: UColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: USizes.fontSizeMd,
      color: UColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: USizes.fontSizeSm,
      color: UColors.black,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: UColors.black.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: UColors.darkGrey,
    suffixIconColor: UColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: USizes.fontSizeMd,
      color: UColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: USizes.fontSizeSm,
      color: UColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: UColors.white.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(USizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UColors.warning),
    ),
  );
}
