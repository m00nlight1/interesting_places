import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/map/domain/entities/map_marker_entity.dart';
import 'package:interesting_places/features/map/domain/entities/map_state.dart';
import 'package:interesting_places/features/map/domain/services/i_location_service.dart';
import 'package:interesting_places/features/map/ui/screens/map_model.dart';
import 'package:interesting_places/features/map/ui/widgets/place_bottom_sheet_widget.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';

abstract interface class IMapWM {
  ValueListenable<MapState> get mapStateListenable;

  MapController get mapController;

  void dispose();

  void onMarkerTap(BuildContext context, MapMarkerEntity marker);

  Future<void> moveToCurrentLocation(BuildContext context);

  Future<void> loadMarkers();

  Future<void> getUserLocation();
}

class MapWM implements IMapWM {
  final IMapModel _model;
  final ILocationService _locationService;
  final IFavoritesRepository _favoritesRepository;
  final MapController _mapController = MapController();

  MapWM(this._model, this._locationService, this._favoritesRepository) {
    getUserLocation();
    _model.getMarkers();
  }

  @override
  void dispose() {
    _model.dispose();
    _mapController.dispose();
  }

  @override
  void onMarkerTap(BuildContext context, MapMarkerEntity marker) {
    _model.selectMarker(marker);
    _mapController.move(marker.point, _mapController.camera.zoom);

    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder:
          (context) => PlaceBottomSheetWidget(
            place: marker.place,
            onCardTap: () => _onPlacePressed(context, marker),
            onLikeTap: () => _onLikePressed(marker),
          ),
    ).closed.then((_) {
      _model.selectMarker(null);
    });
  }

  @override
  Future<void> moveToCurrentLocation(BuildContext context) async {
    final result = await _locationService.getCurrentLocation();
    switch (result) {
      case ResultOk(:final data):
        _model.updateUserLocation(data);
        _mapController.move(data, _mapController.camera.zoom);
      case ResultFailed(:final error):
        _model.updateUserLocation(null);
        if (!context.mounted) return;
        _showPermissionSnackbar(context);
    }
  }

  @override
  Future<void> getUserLocation() async {
    final result = await _locationService.getCurrentLocation();
    switch (result) {
      case ResultOk(:final data):
        _model.updateUserLocation(data);
        _mapController.move(data, _mapController.camera.zoom);
      case ResultFailed(:final error):
        _model.updateUserLocation(null);
    }
  }

  @override
  Future<void> loadMarkers() => _model.getMarkers();

  @override
  ValueListenable<MapState> get mapStateListenable => _model.mapStateListenable;

  @override
  MapController get mapController => _mapController;

  void _onLikePressed(MapMarkerEntity marker) {
    _favoritesRepository.toggleFavorite(marker.place);
  }

  void _onPlacePressed(BuildContext context, MapMarkerEntity marker) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailScreenBuilder(place: marker.place),
      ),
    );
  }

  void _showPermissionSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.noLocationPermission),
        action: SnackBarAction(
          label: AppStrings.placesScreenBottomNavSettings,
          onPressed: _locationService.openAppSettings,
        ),
      ),
    );
  }
}
