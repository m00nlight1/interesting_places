import 'package:flutter/material.dart';
import 'package:interesting_places/uikit/themes/text/app_text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeNotFound(context);
  }

  final TextStyle titleLarge;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle button;
  final TextStyle small;
  final TextStyle smallBold;
  final TextStyle superSmall;

  const AppTextTheme._({
    required this.titleLarge,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.button,
    required this.small,
    required this.smallBold,
    required this.superSmall,
  });

  AppTextTheme.base()
    : titleLarge = AppTextStyle.titleLarge.value,
      title = AppTextStyle.title.value,
      subtitle = AppTextStyle.subtitle.value,
      text = AppTextStyle.text.value,
      button = AppTextStyle.button.value,
      small = AppTextStyle.small.value,
      smallBold = AppTextStyle.smallBold.value,
      superSmall = AppTextStyle.superSmall.value;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? titleLarge,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? text,
    TextStyle? button,
    TextStyle? small,
    TextStyle? smallBold,
    TextStyle? superSmall,
  }) {
    return AppTextTheme._(
      titleLarge: titleLarge ?? this.titleLarge,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      text: text ?? this.text,
      button: button ?? this.button,
      small: small ?? this.small,
      smallBold: smallBold ?? this.smallBold,
      superSmall: superSmall ?? this.superSmall,
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
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      text: TextStyle.lerp(text, other.text, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t)!,
      superSmall: TextStyle.lerp(superSmall, other.superSmall, t)!,
    );
  }
}

Never _throwThemeNotFound(BuildContext context) =>
    throw Exception('App Theme not found');
