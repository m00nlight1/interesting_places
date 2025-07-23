import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get topPadding => MediaQuery.paddingOf(this).top;
}
