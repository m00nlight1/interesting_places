import 'package:interesting_places/api/service/api_client.dart';
import 'package:interesting_places/features/common/data/converters/place_converter.dart';
import 'package:interesting_places/features/common/data/converters/place_type_converter.dart';
import 'package:interesting_places/features/map/data/location_service.dart';
import 'package:interesting_places/features/map/domain/services/i_location_service.dart';
import 'package:interesting_places/features/map/ui/screens/map_model.dart';
import 'package:interesting_places/features/places/data/repositories/places_repository.dart';
import 'package:interesting_places/features/places/domain/repositories/i_places_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class MapDependencies {
  static List<SingleChildWidget> providers() => [
    Provider<IPlacesRepository>(
      create:
          (context) => PlacesRepository(
            apiClient: context.read<ApiClient>(),
            placeDtoToEntityConverter: PlaceDtoToEntityConverter(
              placeTypeConverter: PlaceTypeDtoToEntityConverter(),
            ),
          ),
    ),
    Provider<ILocationService>(create: (_) => LocationService()),
    Provider<IMapModel>(
      create:
          (context) =>
              MapModel(placesRepository: context.read<IPlacesRepository>()),
    ),
  ];
}
