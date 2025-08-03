import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/favorites/domain/entities/favorite_state.dart';

class FavoritesModel implements IFavoritesModel {
  final IFavoritesRepository _favoritesRepository;
  final _favoritesState = ValueNotifier<FavoriteState>(FavoriteStateEmpty());

  FavoritesModel(this._favoritesRepository) {
    _favoritesRepository.favoritesListenable.addListener(_update);
    _update();
  }

  void _update() {
    final places = _favoritesRepository.favoritesListenable.value;
    _favoritesState.value =
        places.isEmpty ? FavoriteStateEmpty() : FavoriteStateData(places);
  }

  @override
  ValueListenable<FavoriteState> get favoritesState => _favoritesState;

  @override
  void load() => _update();

  @override
  void removeFavorite(PlaceEntity place) {
    _favoritesRepository.removeFavorite(place);
  }

  @override
  void dispose() {
    _favoritesRepository.favoritesListenable.removeListener(_update);
    _favoritesState.dispose();
  }
}

abstract interface class IFavoritesModel {
  ValueListenable<FavoriteState> get favoritesState;

  void load();

  void removeFavorite(PlaceEntity place);

  void dispose();
}
