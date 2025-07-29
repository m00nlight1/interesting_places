import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/uikit/buttons/button_rounded.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonWidget({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return ButtonRounded(
      size: 32,
      backgroundColor: colorTheme.primary,
      radius: 50,
      icon: AppSvgIcons.icArrow,
      iconColor: colorTheme.icon,
      onPressed: onPressed ?? Navigator.of(context).pop,
    );
  }
}
