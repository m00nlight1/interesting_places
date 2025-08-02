import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';
import 'package:interesting_places/features/map/domain/entities/map_marker_entity.dart';
import 'package:interesting_places/features/map/domain/entities/map_state.dart';
import 'package:interesting_places/features/places/domain/repositories/i_places_repository.dart';
import 'package:latlong2/latlong.dart';

class MapModel implements IMapModel {
  final IPlacesRepository _placesRepository;

  MapModel({required IPlacesRepository placesRepository})
    : _placesRepository = placesRepository {
    getMarkers();
  }

  final _mapState = ValueNotifier<MapState>(const MapStateLoading());

  @override
  ValueListenable<MapState> get mapStateListenable => _mapState;

  @override
  void dispose() => _mapState.dispose();

  @override
  Future<void> getMarkers() async {
    _mapState.value = const MapStateLoading();
    final placesResult = await _placesRepository.getPlaces();
    switch (placesResult) {
      case ResultOk(:final data):
        final markers =
            data.map((place) => MapMarkerEntity(place: place)).toList();
        _mapState.value = MapStateData(markers: markers);
      case ResultFailed(:final error):
        _mapState.value = MapStateFailure(error);
    }
  }

  @override
  void selectMarker(MapMarkerEntity? selectedMarker) {
    final currentState = _mapState.value;
    if (currentState is! MapStateData) return;

    final updatedMarkers =
        currentState.markers.map((marker) {
          final isSelected = selectedMarker != null && marker == selectedMarker;
          return marker.copyWith(isSelected: isSelected);
        }).toList();
    _mapState.value = currentState.copyWith(markers: updatedMarkers);
  }

  @override
  void updateUserLocation(LatLng? location) {
    final currentState = _mapState.value;
    if (currentState is! MapStateData) return;

    _mapState.value = currentState.copyWith(currentUserLocation: location);
  }
}

abstract interface class IMapModel {
  ValueListenable<MapState> get mapStateListenable;

  void dispose();

  Future<void> getMarkers();

  void selectMarker(MapMarkerEntity? marker);

  void updateUserLocation(LatLng? location);
}
