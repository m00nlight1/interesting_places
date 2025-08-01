import 'package:flutter/material.dart';

const _fontFamily = 'Roboto';

enum AppTextStyle {
  titleLarge(
    TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.125,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  title(
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  subtitle(
    TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  text(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.25,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  button(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.29,
      letterSpacing: 0.5,
      fontFamily: _fontFamily,
    ),
  ),
  small(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.29,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  smallBold(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.29,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  ),
  superSmall(
    TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0,
      fontFamily: _fontFamily,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
