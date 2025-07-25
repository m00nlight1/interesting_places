import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';

final class FavoritesRepository implements IFavoritesRepository {
  final _favoritesListenable = ValueNotifier<List<PlaceEntity>>([]);

  FavoritesRepository();

  @override
  void dispose() {
    _favoritesListenable.dispose();
  }

  @override
  ValueListenable<List<PlaceEntity>> get favoritesListenable =>
      _favoritesListenable;

  @override
  Future<void> fetchFavorites() async {
    // В ОЗУ версии просто возвращаем текущий список
    // Здесь можно добавить имитацию задержки загрузки
  }

  @override
  bool isFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    return favorites.any((element) => element.name == place.name);
  }

  @override
  void removeFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    final newFavorites =
        favorites.where((element) => element.name != place.name).toList();
    _favoritesListenable.value = newFavorites;
  }

  @override
  void toggleFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    final index = favorites.indexWhere((element) => element.name == place.name);

    if (index == -1) {
      _favoritesListenable.value = [...favorites, place];
    } else {
      final newFavorites = [...favorites]..removeAt(index);
      _favoritesListenable.value = newFavorites;
    }
  }
}
