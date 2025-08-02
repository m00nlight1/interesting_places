import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/entities/place_type_entity.dart';
import 'package:interesting_places/uikit/buttons/icon_action_button.dart';
import 'package:interesting_places/uikit/images/network_image_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/colors/app_colors.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final PlaceEntity place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final bool isFavorite;
  final PlaceCardType cardType;
  final Color? backgroundColor;

  const PlaceCardWidget({
    super.key,
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    this.backgroundColor = AppColors.colorBackground,
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
        color: backgroundColor,
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
                    NetworkImageWidget(
                      height: _imageHeight,
                      imgUrl: place.images.firstWhere(
                        (_) => true,
                        orElse: () => '',
                      ),
                    ),
                    SizedBox(
                      height: _imageHeight,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, colorTheme.inactive],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.placeType.displayName.toLowerCase(),
                        style: textTheme.smallBold.copyWith(
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
                        style: textTheme.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: textTheme.small.copyWith(
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
              child: IconActionButton(
                onPressed: onLikeTap,
                svgPath:
                    isFavorite ? AppSvgIcons.icHeartFull : AppSvgIcons.icHeart,
                color: isFavorite ? colorTheme.error : colorTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
