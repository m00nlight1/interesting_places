import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final PlaceEntity place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final bool isFavorite;
  final PlaceCardType cardType;

  const PlaceCardWidget({
    super.key,
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    this.isFavorite = false,
  });

  static const cardHeight = 188.0;
  static const _imageHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return SizedBox(
      height: cardHeight,
      child: Material(
        color: colorTheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _imageHeight,
                      child: Image.network(
                        place.images.firstWhere((_) => true, orElse: () => ''),
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => Center(
                              child: Text('Нет фото'),
                            ), // todo: add strings
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.placeType.name.toLowerCase(),
                        style: textTheme.labelSmall.copyWith(
                          color: colorTheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: textTheme.bodySmall.copyWith(
                          color: colorTheme.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onCardTap),
              ),
            ),
            Positioned(
              top: 8,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? colorTheme.error : colorTheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
