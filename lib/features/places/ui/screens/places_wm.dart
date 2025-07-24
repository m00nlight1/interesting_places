import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/common/models/place.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:interesting_places/features/places/ui/screens/places_model.dart';

abstract interface class IPlacesWM {
  ValueListenable<List<Place>> get placesStateListenable;

  void dispose();

  void onPlacePressed(BuildContext context, Place place);

  void onLikePressed(Place place);

  bool isFavorite(Place place);
}

class PlacesWM implements IPlacesWM {
  final IPlacesModel _model;
  final IFavoritesRepository _favoritesRepository;

  PlacesWM(this._model, this._favoritesRepository);

  @override
  void dispose() => _model.dispose();

  @override
  bool isFavorite(Place place) => _favoritesRepository.isFavorite(place);

  @override
  void onLikePressed(Place place) {
    _favoritesRepository.toggleFavorite(place);
  }

  @override
  void onPlacePressed(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailScreenBuilder(place: place),
      ),
    );
  }

  @override
  ValueListenable<List<Place>> get placesStateListenable =>
      _model.placesStateListenable;
}
