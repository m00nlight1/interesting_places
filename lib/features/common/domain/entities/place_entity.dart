import 'package:equatable/equatable.dart';
import 'package:interesting_places/features/common/domain/entities/place_type_entity.dart';

class PlaceEntity extends Equatable {
  const PlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.lat,
    required this.lon,
    required this.placeType,
  });

  final int id;

  final String name;

  final String description;

  final List<String> images;

  final double lat;

  final double lon;

  final PlaceTypeEntity placeType;

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    images,
    lat,
    lon,
    placeType,
  ];
}
