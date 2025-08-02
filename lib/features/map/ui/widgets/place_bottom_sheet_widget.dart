import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/common/ui/place_card_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:provider/provider.dart';

class PlaceBottomSheetWidget extends StatelessWidget {
  final PlaceEntity place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;

  const PlaceBottomSheetWidget({
    super.key,
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    return Builder(
      builder: (context) {
        final favoritesRepository = context.read<IFavoritesRepository>();
        return ValueListenableBuilder<List<PlaceEntity>>(
          valueListenable: favoritesRepository.favoritesListenable,
          builder: (context, favorites, _) {
            final isFavorite = favoritesRepository.isFavorite(place);
            return Padding(
              padding: const EdgeInsets.all(16),
              child: PlaceCardWidget(
                place: place,
                isFavorite: isFavorite,
                onCardTap: onCardTap,
                onLikeTap: onLikeTap,
                backgroundColor: colorTheme.primary,
              ),
            );
          },
        );
      },
    );
  }
}
