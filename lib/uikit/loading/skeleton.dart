import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';

class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final double? radius;
  final BorderRadius? borderRadius;

  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.background,
    this.radius,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background ?? colorTheme.loader,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
