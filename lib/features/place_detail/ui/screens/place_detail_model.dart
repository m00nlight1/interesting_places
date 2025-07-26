import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';

class PlaceDetailModel implements IPlaceDetailModel {
  final IFavoritesRepository _favoritesRepository;
  final PlaceEntity _placeEntity;

  PlaceDetailModel({
    required PlaceEntity placeEntity,
    required IFavoritesRepository favoritesRepository,
  }) : _favoritesRepository = favoritesRepository,
       _placeEntity = placeEntity;

  @override
  bool isFavorite() => _favoritesRepository.isFavorite(_placeEntity);

  @override
  PlaceEntity get placeEntity => _placeEntity;

  @override
  bool toggleFavorite() {
    _favoritesRepository.toggleFavorite(_placeEntity);
    return isFavorite();
  }
}

abstract interface class IPlaceDetailModel {
  PlaceEntity get placeEntity;

  bool isFavorite();

  bool toggleFavorite();
}
