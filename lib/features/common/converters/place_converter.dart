import 'package:interesting_places/api/data/place_dto.dart';
import 'package:interesting_places/core/data/converter/converter.dart';
import 'package:interesting_places/features/common/converters/place_type_converter.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

/// Конвертер из [PlaceDto] в [PlaceEntity].
typedef IPlaceDtoToEntityConverter = Converter<PlaceEntity, PlaceDto>;

/// Реализация [IPlaceDtoToEntityConverter].
final class PlaceDtoToEntityConverter extends IPlaceDtoToEntityConverter {
  /// Конвертер для типа места.
  final IPlaceTypeDtoToEntityConverter placeTypeConverter;

  const PlaceDtoToEntityConverter({required this.placeTypeConverter});

  @override
  PlaceEntity convert(PlaceDto input) {
    final placeType = placeTypeConverter.convert(input.placeType);
    return PlaceEntity(
      id: input.id,
      name: input.name,
      description: input.description,
      placeType: placeType,
      images: input.images,
      lat: input.lat,
      lon: input.lon,
    );
  }
}
