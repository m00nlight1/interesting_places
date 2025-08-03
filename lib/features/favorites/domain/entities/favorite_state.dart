import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

@immutable
sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteStateEmpty extends FavoriteState {
  const FavoriteStateEmpty();
}

final class FavoriteStateData extends FavoriteState {
  final List<PlaceEntity> places;

  const FavoriteStateData(this.places);

  @override
  int get hashCode => places.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteStateData &&
          runtimeType == other.runtimeType &&
          listEquals(places, other.places);
}
