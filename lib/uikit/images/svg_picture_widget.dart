import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPictureWidget extends StatelessWidget {
  final String svgPath;

  final Color? color;

  final double? width;

  final double? height;

  final BoxFit fit;

  const SvgPictureWidget(
    this.svgPath, {
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color;

    final colorFilter =
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn);

    return SvgPicture.asset(
      svgPath,
      width: width,
      height: height,
      fit: fit,
      colorFilter: colorFilter,
    );
  }
}
