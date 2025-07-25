import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/failure/failure.dart';
import 'package:interesting_places/features/places/domain/enities/liked_place_entity.dart';

@immutable
sealed class PlacesState {
  const PlacesState();
}

final class PlacesStateLoading extends PlacesState {
  const PlacesStateLoading();
}

final class PlacesStateFailure extends PlacesState {
  final Failure failure;

  const PlacesStateFailure(this.failure);

  @override
  int get hashCode => failure.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesStateFailure &&
          runtimeType == other.runtimeType &&
          failure == other.failure;
}

final class PlacesStateData extends PlacesState {
  final List<LikedPlaceEntity> places;

  const PlacesStateData(this.places);

  @override
  int get hashCode => places.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesStateData &&
          runtimeType == other.runtimeType &&
          listEquals(places, other.places);
}
