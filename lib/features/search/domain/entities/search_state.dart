import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/failure/failure.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

@immutable
sealed class SearchState {
  const SearchState();
}

final class SearchStateInitial extends SearchState {
  const SearchStateInitial();
}

final class SearchStateEmpty extends SearchState {
  const SearchStateEmpty();
}

final class SearchStateFailure extends SearchState {
  final Failure failure;

  const SearchStateFailure(this.failure);

  @override
  int get hashCode => failure.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchStateFailure &&
          runtimeType == other.runtimeType &&
          failure == other.failure;
}

final class SearchStateData extends SearchState {
  final List<PlaceEntity> places;

  const SearchStateData(this.places);

  @override
  int get hashCode => places.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchStateData &&
          runtimeType == other.runtimeType &&
          listEquals(places, other.places);
}
