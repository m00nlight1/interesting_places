import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/places/domain/enities/liked_place_entity.dart';
import 'package:interesting_places/features/places/domain/enities/places_state.dart';
import 'package:interesting_places/features/places/domain/repositories/i_places_repository.dart';

class PlacesModel implements IPlacesModel {
  final IPlacesRepository _placesRepository;
  final IFavoritesRepository _favoritesRepository;

  PlacesModel({
    required IPlacesRepository placesRepository,
    required IFavoritesRepository favoritesRepository,
  }) : _placesRepository = placesRepository,
       _favoritesRepository = favoritesRepository {
    // listen to favorites changes to update state.
    _favoritesRepository.favoritesListenable.addListener(_onFavoritesChanged);
  }

  final _placesState = ValueNotifier<PlacesState>(const PlacesStateLoading());

  List<PlaceEntity>? _cachedRemotePlaces;

  @override
  ValueListenable<PlacesState> get placesStateListenable => _placesState;

  @override
  void dispose() {
    _favoritesRepository.favoritesListenable.removeListener(
      _onFavoritesChanged,
    );
    _placesState.dispose();
  }

  @override
  Future<void> getPlaces() async {
    _placesState.value = const PlacesStateLoading();
    final placesResult = await _placesRepository.getPlaces();
    switch (placesResult) {
      case ResultOk(:final data):
        _cachedRemotePlaces = data;
        _updateCombinedPlaces();
      case ResultFailed(:final error):
        _placesState.value = PlacesStateFailure(error);
    }
  }

  void _onFavoritesChanged() {
    _updateCombinedPlaces();
  }

  void _updateCombinedPlaces() {
    final remote = _cachedRemotePlaces;
    if (remote == null) return;

    final favorites = _favoritesRepository.favoritesListenable.value;
    final combined =
        remote
            .map(
              (place) => LikedPlaceEntity(
                place: place,
                isFavorite: favorites.any((f) => f.name == place.name),
              ),
            )
            .toList();

    _placesState.value = PlacesStateData(combined);
  }

  @override
  ValueListenable<List<PlaceEntity>> get favoritesPlaces =>
      _favoritesRepository.favoritesListenable;
}

abstract interface class IPlacesModel {
  ValueListenable<PlacesState> get placesStateListenable;

  ValueListenable<List<PlaceEntity>> get favoritesPlaces;

  void dispose();

  Future<void> getPlaces();
}
