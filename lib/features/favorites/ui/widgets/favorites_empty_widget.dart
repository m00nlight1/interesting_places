import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPictureWidget(AppSvgIcons.icFavoritesEmpty),
          const SizedBox(height: 24),
          Text(
            AppStrings.emptyTitle,
            style: textTheme.subtitle.copyWith(color: colorTheme.inactive),
          ),
        ],
      ),
    );
  }
}
