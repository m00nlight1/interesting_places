import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

abstract class AppThemeData {
  static const _lightColorTheme = AppColorTheme.light();
  static final _textTheme = AppTextTheme.base();

  static final lightTheme = ThemeData(
    extensions: [_lightColorTheme, _textTheme],
    brightness: Brightness.light,
    primaryColor: _lightColorTheme.primary,
    scaffoldBackgroundColor: _lightColorTheme.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorTheme.primary,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: _lightColorTheme.icon),
      titleTextStyle: _textTheme.titleLarge.copyWith(
        color: _lightColorTheme.textPrimary,
      ),
    ),
    dividerTheme: DividerThemeData(color: _lightColorTheme.divider),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: _lightColorTheme.accent,
      inactiveTrackColor: _lightColorTheme.inactive,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbColor: _lightColorTheme.primary,
      overlayShape: SliderComponentShape.noOverlay,
      tickMarkShape: SliderTickMarkShape.noTickMark,
      showValueIndicator: ShowValueIndicator.never,
      padding: EdgeInsets.zero,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorTheme.primary,
      unselectedItemColor: _lightColorTheme.inactive,
      selectedItemColor: _lightColorTheme.active,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      dragHandleColor: Colors.transparent,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _lightColorTheme.textSecondary,
      selectionColor: _lightColorTheme.textSecondary.withOpacity(0.4),
      selectionHandleColor: _lightColorTheme.textSecondary,
    ),
  );
}
