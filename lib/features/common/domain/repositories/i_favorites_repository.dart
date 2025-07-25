import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

abstract interface class IFavoritesRepository {
  ValueListenable<List<PlaceEntity>> get favoritesListenable;

  Future<void> fetchFavorites();

  void dispose();

  void toggleFavorite(PlaceEntity place);

  void removeFavorite(PlaceEntity place);

  bool isFavorite(PlaceEntity place);
}
