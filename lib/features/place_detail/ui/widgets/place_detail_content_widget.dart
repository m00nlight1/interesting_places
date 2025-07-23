import 'package:flutter/material.dart';
import 'package:interesting_places/common/models/place.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class PlaceDetailContentWidget extends StatelessWidget {
  final Place place;

  const PlaceDetailContentWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          place.name,
          style: textTheme.bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(place.type.toLowerCase(), style: textTheme.labelSmall),
        const SizedBox(height: 24),
        Text(
          place.description,
          style: textTheme.bodySmall.copyWith(color: colorTheme.textSecondary),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
