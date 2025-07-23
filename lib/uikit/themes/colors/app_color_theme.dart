import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/colors/app_colors.dart';

@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  static AppColorTheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorTheme>() ??
        _throwThemeNotFound(context);
  }

  final Color primary;
  final Color icon;
  final Color divider;
  final Color accent;
  final Color inactive;
  final Color imagePlaceholder;
  final Color textPrimary;
  final Color textSecondary;
  final Color buttonBackground;
  final Color error;

  const AppColorTheme._({
    required this.primary,
    required this.icon,
    required this.divider,
    required this.accent,
    required this.inactive,
    required this.imagePlaceholder,
    required this.textPrimary,
    required this.textSecondary,
    required this.buttonBackground,
    required this.error,
  });

  const AppColorTheme.light()
    : primary = AppColors.colorWhite,
      icon = AppColors.colorBlack,
      divider = AppColors.colorGrey,
      accent = AppColors.colorGreenAccent,
      inactive = AppColors.colorGrey300,
      imagePlaceholder = AppColors.colorGrey300,
      textPrimary = AppColors.colorBlack,
      textSecondary = AppColors.colorBlack54,
      buttonBackground = AppColors.colorWhite,
      error = AppColors.colorRed;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? primary,
    Color? icon,
    Color? divider,
    Color? accent,
    Color? inactive,
    Color? imagePlaceholder,
    Color? textPrimary,
    Color? textSecondary,
    Color? buttonBackground,
    Color? error,
  }) {
    return AppColorTheme._(
      primary: primary ?? this.primary,
      icon: icon ?? this.icon,
      divider: divider ?? this.divider,
      accent: accent ?? this.accent,
      inactive: inactive ?? this.inactive,
      imagePlaceholder: imagePlaceholder ?? this.imagePlaceholder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) return this;

    return AppColorTheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      imagePlaceholder:
          Color.lerp(imagePlaceholder, other.imagePlaceholder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      buttonBackground:
          Color.lerp(buttonBackground, other.buttonBackground, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}

Never _throwThemeNotFound(BuildContext context) =>
    throw Exception('App Theme not found');
