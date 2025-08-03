import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  static const _iconSize = 64.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPictureWidget(
            AppSvgIcons.icSearch,
            width: _iconSize,
            height: _iconSize,
          ),
          const SizedBox(height: 24),
          Text(
            AppStrings.searchEmptyTitle,
            style: textTheme.subtitle.copyWith(color: colorTheme.inactive),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.searchEmptyDescription,
            textAlign: TextAlign.center,
            style: textTheme.small.copyWith(color: colorTheme.inactive),
          ),
        ],
      ),
    );
  }
}
