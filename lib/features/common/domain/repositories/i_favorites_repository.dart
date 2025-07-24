import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/models/place.dart';

abstract interface class IFavoritesRepository {
  ValueListenable<List<Place>> get favoritesListenable;

  Future<void> fetchFavorites();

  void dispose();

  void toggleFavorite(Place place);

  void removeFavorite(Place place);

  bool isFavorite(Place place);
}
