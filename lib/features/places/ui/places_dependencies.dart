import 'package:interesting_places/api/service/api_client.dart';
import 'package:interesting_places/features/common/data/converters/place_converter.dart';
import 'package:interesting_places/features/common/data/converters/place_type_converter.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/places/data/repositories/places_repository.dart';
import 'package:interesting_places/features/places/domain/repositories/i_places_repository.dart';
import 'package:interesting_places/features/places/ui/screens/places_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class PlacesDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IPlacesRepository>(
        create:
            (context) => PlacesRepository(
              apiClient: context.read<ApiClient>(),
              placeDtoToEntityConverter: PlaceDtoToEntityConverter(
                placeTypeConverter: PlaceTypeDtoToEntityConverter(),
              ),
            ),
      ),
      Provider<IPlacesModel>(
        create:
            (context) => PlacesModel(
              placesRepository: context.read<IPlacesRepository>(),
              favoritesRepository: context.read<IFavoritesRepository>(),
            ),
      ),
    ];
  }
}
