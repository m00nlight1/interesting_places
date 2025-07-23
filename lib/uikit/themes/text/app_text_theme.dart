import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/text/app_text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeNotFound(context);
  }

  final TextStyle titleLarge;
  final TextStyle bodySmall;
  final TextStyle bodyMedium;
  final TextStyle labelSmall;

  const AppTextTheme._({
    required this.titleLarge,
    required this.bodySmall,
    required this.bodyMedium,
    required this.labelSmall,
  });

  AppTextTheme.base()
    : titleLarge = AppTextStyle.titleLarge.value,
      bodySmall = AppTextStyle.bodySmall.value,
      bodyMedium = AppTextStyle.bodyMedium.value,
      labelSmall = AppTextStyle.labelSmall.value;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? titleLarge,
    TextStyle? bodySmall,
    TextStyle? bodyMedium,
    TextStyle? labelSmall,
  }) {
    return AppTextTheme._(
      titleLarge: titleLarge ?? this.titleLarge,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) return this;

    return AppTextTheme._(
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }
}

Never _throwThemeNotFound(BuildContext context) =>
    throw Exception('App Theme not found');
