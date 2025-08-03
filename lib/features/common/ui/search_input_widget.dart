import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueListenable<bool> hasText;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClear;

  const SearchInputWidget({
    super.key,
    required this.controller,
    required this.hasText,
    required this.onSearchChanged,
    required this.onSearchClear,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: ValueListenableBuilder<bool>(
        valueListenable: hasText,
        builder: (context, hasText, _) {
          return TextField(
            controller: controller,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: AppStrings.searchHint,
              hintStyle: textTheme.text.copyWith(
                fontWeight: FontWeight.w400,
                color: colorTheme.inactive,
              ),
              labelStyle: textTheme.text.copyWith(fontWeight: FontWeight.w400),
              filled: true,
              fillColor: colorTheme.inactiveVariant,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
              prefixIcon: SvgPictureWidget(
                AppSvgIcons.icSearch,
                fit: BoxFit.none,
              ),
              suffixIcon:
                  hasText
                      ? IconButton(
                        icon: SvgPictureWidget(AppSvgIcons.icClear),
                        onPressed: onSearchClear,
                      )
                      : SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
