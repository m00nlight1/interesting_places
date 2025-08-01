import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/settings/ui/screens/settings_wm.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class SettingsScreen extends StatelessWidget {
  final ISettingsWM wm;

  const SettingsScreen({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.placesScreenBottomNavSettings,
          style: textTheme.subtitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            ListTile(
              title: Text(
                AppStrings.settingsViewTutorial,
                style: textTheme.text.copyWith(fontWeight: FontWeight.w400),
              ),
              trailing: SvgPictureWidget(
                AppSvgIcons.icInfo,
                color: colorTheme.accent,
              ),
              onTap: () => wm.onViewTutorialPressed(context),
              contentPadding: const EdgeInsets.only(right: 8),
            ),
            const Divider(height: 0, thickness: 1),
          ],
        ),
      ),
    );
  }
}
