import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/places/ui/places_dependencies.dart';
import 'package:interesting_places/features/places/ui/screens/places_model.dart';
import 'package:interesting_places/features/places/ui/screens/places_screen.dart';
import 'package:interesting_places/features/places/ui/screens/places_wm.dart';
import 'package:interesting_places/features/search/ui/screens/search_model.dart';
import 'package:interesting_places/features/search/ui/screens/search_wm.dart';
import 'package:interesting_places/features/search/ui/search_dependencies.dart';
import 'package:provider/provider.dart';

class PlacesScreenBuilder extends StatelessWidget {
  const PlacesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlacesDependencies.providers(),
        ...SearchDependencies.providers(),
        Provider<IPlacesWM>(
          create:
              (context) => PlacesWM(
                context.read<IPlacesModel>(),
                context.read<IFavoritesRepository>(),
              ),
        ),
        Provider<ISearchWM>(
          create: (context) => SearchWM(model: context.read<ISearchModel>()),
          dispose: (_, wm) => wm.dispose(),
        ),
      ],
      child: Builder(
        builder:
            (context) => PlacesScreen(
              placesWm: context.read<IPlacesWM>(),
              searchWM: context.read<ISearchWM>(),
            ),
      ),
    );
  }
}
