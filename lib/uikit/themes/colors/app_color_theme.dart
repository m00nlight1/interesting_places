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
  final Color loader;
  final Color accent;
  final Color active;
  final Color inactive;
  final Color inactiveVariant;
  final Color secondaryVariant;
  final Color imagePlaceholder;
  final Color textPrimary;
  final Color textSecondary;
  final Color buttonBackground;
  final Color error;

  const AppColorTheme._({
    required this.primary,
    required this.icon,
    required this.divider,
    required this.loader,
    required this.accent,
    required this.active,
    required this.inactive,
    required this.inactiveVariant,
    required this.secondaryVariant,
    required this.imagePlaceholder,
    required this.textPrimary,
    required this.textSecondary,
    required this.buttonBackground,
    required this.error,
  });

  const AppColorTheme.light()
    : primary = AppColors.colorWhite,
      icon = AppColors.colorBlack,
      divider = AppColors.colorInactiveBlack,
      loader = AppColors.colorSecondary3,
      accent = AppColors.colorWhiteGreen,
      active = AppColors.colorSecondary,
      inactive = AppColors.colorInactiveBlack,
      inactiveVariant = AppColors.colorBackground,
      secondaryVariant = AppColors.colorSecondary2,
      imagePlaceholder = AppColors.colorBackground,
      textPrimary = AppColors.colorWhiteMain,
      textSecondary = AppColors.colorSecondary,
      buttonBackground = AppColors.colorWhite,
      error = AppColors.colorWhiteError;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? primary,
    Color? icon,
    Color? divider,
    Color? loader,
    Color? accent,
    Color? active,
    Color? inactive,
    Color? inactiveVariant,
    Color? secondaryVariant,
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
      loader: loader ?? this.loader,
      accent: accent ?? this.accent,
      active: active ?? this.active,
      inactive: inactive ?? this.inactive,
      inactiveVariant: inactiveVariant ?? this.inactiveVariant,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
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
      loader: Color.lerp(loader, other.loader, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      active: Color.lerp(active, other.active, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      inactiveVariant: Color.lerp(inactiveVariant, other.inactiveVariant, t)!,
      secondaryVariant:
          Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
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
