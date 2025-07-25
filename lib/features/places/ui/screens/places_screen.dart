import 'package:flutter/material.dart';
import 'package:interesting_places/features/places/domain/enities/places_state.dart';
import 'package:interesting_places/features/places/ui/screens/places_wm.dart';
import 'package:interesting_places/features/places/ui/widgets/place_card_widget.dart';

class PlacesScreen extends StatelessWidget {
  final IPlacesWM wm;

  const PlacesScreen({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<PlacesState>(
        valueListenable: wm.placesStateListenable,
        builder: (context, places, _) {
          return NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  // todo: add strings
                  SliverAppBar(
                    title: const Text('Interesting Places'),
                    floating: true,
                    snap: true,
                  ),
                ],
            body: RefreshIndicator.adaptive(
              onRefresh: wm.loadPlaces,
              child: switch (places) {
                PlacesStateLoading() => Center(
                  child: Text('Загрузка...'),
                ), // todo: add strings
                PlacesStateFailure(:final failure) => Center(
                  child: Text('Ошибка: $failure'), // todo: add strings
                ),
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
                      onCardTap:
                          () => wm.onPlacePressed(context, likedPlace.place),
                      onLikeTap: () => wm.onLikePressed(likedPlace.place),
                      isFavorite: likedPlace.isFavorite,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
