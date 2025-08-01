import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/entities/place_type_entity.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class PlaceDetailContentWidget extends StatelessWidget {
  final PlaceEntity place;

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
          style: textTheme.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          place.placeType.displayName.toLowerCase(),
          style: textTheme.smallBold,
        ),
        const SizedBox(height: 24),
        Text(
          place.description,
          style: textTheme.small.copyWith(color: colorTheme.textSecondary),
        ),
      ],
    );
  }
}
