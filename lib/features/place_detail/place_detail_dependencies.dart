import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class PlaceDetailDependencies {
  static List<SingleChildWidget> providers(PlaceEntity place) {
    return [
      Provider<IPlaceDetailModel>(
        create:
            (context) => PlaceDetailModel(
              placeEntity: place,
              favoritesRepository: context.read<IFavoritesRepository>(),
            ),
      ),
    ];
  }
}
