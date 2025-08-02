import 'package:interesting_places/core/domain/entities/result/request_operation.dart';
import 'package:latlong2/latlong.dart';

abstract interface class ILocationService {
  RequestOperation<LatLng> getCurrentLocation();
}
