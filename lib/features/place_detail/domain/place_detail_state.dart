import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

@immutable
class PlaceDetailState {
  final PlaceEntity place;

  const PlaceDetailState({required this.place});
}
