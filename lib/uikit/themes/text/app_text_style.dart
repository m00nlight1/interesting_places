import 'package:flutter/material.dart';

const _fontFamily = 'Roboto';

enum AppTextStyle {
  titleLarge(
    TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.125,
      fontFamily: _fontFamily,
    ),
  ),
  bodyMedium(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.125,
      fontFamily: _fontFamily,
    ),
  ),
  bodySmall(
    TextStyle(
      fontSize: 14,
      height: 1.125,
      letterSpacing: 0.5,
      fontFamily: _fontFamily,
    ),
  ),
  labelSmall(
    TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.125,
      fontFamily: _fontFamily,
    ),
  ),
  labelMedium(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
      height: 1.29,
      fontFamily: _fontFamily,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
