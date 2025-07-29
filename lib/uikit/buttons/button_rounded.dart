import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';

class ButtonRounded extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final double radius;
  final String icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final double? elevation;

  const ButtonRounded({
    required this.size,
    required this.backgroundColor,
    required this.radius,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size(size, size)),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        child: SvgPictureWidget(icon, color: iconColor),
      ),
    );
  }
}
