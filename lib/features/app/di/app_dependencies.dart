import 'package:interesting_places/features/common/data/repositories/favorites_repository.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IFavoritesRepository>(create: (_) => FavoritesRepository()),
    ];
  }
}
