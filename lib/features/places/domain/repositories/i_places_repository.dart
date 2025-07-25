import 'package:interesting_places/core/domain/entities/result/request_operation.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';

abstract interface class IPlacesRepository {
  RequestOperation<List<PlaceEntity>> getPlaces();
}
