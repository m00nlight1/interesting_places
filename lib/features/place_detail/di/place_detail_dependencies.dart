import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class PlaceDetailDependencies {
  static List<SingleChildWidget> providers() {
    return [Provider<IPlaceDetailModel>(create: (_) => PlaceDetailModel())];
  }
}
