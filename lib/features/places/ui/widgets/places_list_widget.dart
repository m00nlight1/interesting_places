import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/ui/place_card_widget.dart';
import 'package:interesting_places/features/places/domain/enities/places_state.dart';
import 'package:interesting_places/features/places/ui/screens/places_wm.dart';
import 'package:interesting_places/uikit/error/app_error_widget.dart';
import 'package:interesting_places/uikit/loading/skeleton.dart';

class PlacesListWidget extends StatelessWidget {
  final IPlacesWM wm;

  const PlacesListWidget({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PlacesState>(
      valueListenable: wm.placesStateListenable,
      builder: (context, places, _) {
        return RefreshIndicator.adaptive(
          onRefresh: wm.loadPlaces,
          child: switch (places) {
            PlacesStateLoading() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder:
                  (context, index) => const Skeleton(
                    height: PlaceCardWidget.cardHeight,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
            PlacesStateFailure(:final failure) => const AppErrorWidget(),
            PlacesStateData(:final places) => ListView.separated(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 32,
              ),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final likedPlace = places[index];
                return PlaceCardWidget(
                  place: likedPlace.place,
                  onCardTap: () => wm.onPlacePressed(context, likedPlace.place),
                  onLikeTap: () => wm.onLikePressed(likedPlace.place),
                  isFavorite: likedPlace.isFavorite,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 24),
            ),
          },
        );
      },
    );
  }
}
