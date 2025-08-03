import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/common/ui/place_card_widget.dart';
import 'package:interesting_places/features/favorites/domain/entities/favorite_state.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_wm.dart';
import 'package:interesting_places/features/favorites/ui/widgets/favorites_empty_widget.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';

class FavoritesScreen extends StatelessWidget {
  final IFavoritesWM wm;

  const FavoritesScreen({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorTheme = AppColorTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.placesScreenBottomNavFavorites,
          style: textTheme.subtitle,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<FavoriteState>(
        valueListenable: wm.favoritesStateListenable,
        builder: (context, state, _) {
          return switch (state) {
            FavoriteStateEmpty() => const FavoritesEmptyWidget(),
            FavoriteStateData(:final places) => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return Dismissible(
                  key: ValueKey(place.id),
                  direction: DismissDirection.endToStart,
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorTheme.error,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPictureWidget(
                              AppSvgIcons.icBucket,
                              color: colorTheme.primary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppStrings.deleteButton,
                              style: textTheme.superSmall.copyWith(
                                color: colorTheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onDismissed: (_) => wm.onRemovePressed(place),
                  child: PlaceCardWidget(
                    cardType: PlaceCardType.favorite,
                    place: place,
                    onCardTap: () => wm.onPlacePressed(context, place),
                    onShareTap: () => wm.onSharePressed(place),
                    onRemoveTap: () => wm.onRemovePressed(place),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
          };
        },
      ),
    );
  }
}
