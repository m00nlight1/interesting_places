import 'package:interesting_places/features/places/ui/screens/places_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class PlacesDependencies {
  static List<SingleChildWidget> providers() {
    return [Provider<IPlacesModel>(create: (_) => PlacesModel())];
  }
}
