import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class FavoritesDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IFavoritesModel>(
        create:
            (context) => FavoritesModel(context.read<IFavoritesRepository>()),
      ),
    ];
  }
}
