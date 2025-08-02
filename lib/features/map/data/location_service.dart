import 'package:geolocator/geolocator.dart';
import 'package:interesting_places/core/domain/entities/failure/unknown_failure.dart';
import 'package:interesting_places/core/domain/entities/result/request_operation.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';
import 'package:interesting_places/features/map/domain/services/i_location_service.dart';
import 'package:latlong2/latlong.dart';

class LocationService implements ILocationService {
  @override
  RequestOperation<LatLng> getCurrentLocation() async {
    final hasPermission = await _hasLocationPermission();
    if (!hasPermission) {
      return Result.failed(
        UnknownFailure(message: 'Location permission denied'),
        StackTrace.current,
      );
    }
    final position = await Geolocator.getCurrentPosition();
    final point = LatLng(position.latitude, position.longitude);
    return Result.ok(point);
  }

  Future<bool> _hasLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  void openAppSettings() => Geolocator.openAppSettings();
}
