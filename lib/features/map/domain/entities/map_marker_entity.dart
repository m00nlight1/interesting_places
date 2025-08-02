import 'package:equatable/equatable.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerEntity extends Equatable {
  final PlaceEntity place;
  final LatLng point;

  final bool isSelected;

  MapMarkerEntity({required this.place, this.isSelected = false})
    : point = LatLng(place.lat, place.lon);

  MapMarkerEntity copyWith({bool? isSelected}) {
    return MapMarkerEntity(
      place: place,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [place, point, isSelected];
}
