import 'package:interesting_places/assets/strings/app_strings.dart';

enum PlaceTypeEntity {
  other,
  park,
  monument,
  theatre,
  museum,
  temple,
  hotel,
  restaurant,
  cafe,
  shopping,
}

extension PlaceTypeEntityExtension on PlaceTypeEntity {
  String get displayName {
    return switch (this) {
      PlaceTypeEntity.restaurant => AppStrings.placeTypeRestaurant,
      PlaceTypeEntity.cafe => AppStrings.placeTypeCafe,
      PlaceTypeEntity.park => AppStrings.placeTypePark,
      PlaceTypeEntity.museum => AppStrings.placeTypeMuseum,
      PlaceTypeEntity.monument => AppStrings.placeTypeMonument,
      PlaceTypeEntity.theatre => AppStrings.placeTypeTheatre,
      PlaceTypeEntity.temple => AppStrings.placeTypeTemple,
      PlaceTypeEntity.hotel => AppStrings.placeTypeHotel,
      PlaceTypeEntity.shopping => AppStrings.placeTypeShopping,
      PlaceTypeEntity.other => AppStrings.placeTypeOther,
    };
  }
}
