import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/failure/failure.dart';
import 'package:interesting_places/features/map/domain/entities/map_marker_entity.dart';
import 'package:latlong2/latlong.dart';

@immutable
sealed class MapState {
  const MapState();
}

final class MapStateLoading extends MapState {
  const MapStateLoading();
}

final class MapStateFailure extends MapState {
  final Failure failure;

  const MapStateFailure(this.failure);

  @override
  int get hashCode => failure.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapStateFailure &&
          runtimeType == other.runtimeType &&
          failure == other.failure;
}

final class MapStateData extends MapState {
  final List<MapMarkerEntity> markers;
  final LatLng? currentUserLocation;

  const MapStateData({required this.markers, this.currentUserLocation});

  MapStateData copyWith({
    List<MapMarkerEntity>? markers,
    LatLng? currentUserLocation,
  }) {
    return MapStateData(
      markers: markers ?? this.markers,
      currentUserLocation: currentUserLocation ?? this.currentUserLocation,
    );
  }

  @override
  int get hashCode =>
      Object.hash(markers.hashCode, currentUserLocation.hashCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapStateData &&
          runtimeType == other.runtimeType &&
          listEquals(markers, other.markers) &&
          currentUserLocation == other.currentUserLocation;
}
