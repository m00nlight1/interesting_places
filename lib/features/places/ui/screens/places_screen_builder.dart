import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/places/di/places_dependencies.dart';
import 'package:interesting_places/features/places/ui/screens/places_model.dart';
import 'package:interesting_places/features/places/ui/screens/places_screen.dart';
import 'package:interesting_places/features/places/ui/screens/places_wm.dart';
import 'package:provider/provider.dart';

class PlacesScreenBuilder extends StatelessWidget {
  const PlacesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlacesDependencies.providers(),
        Provider<IPlacesWM>(
          create:
              (context) => PlacesWM(
                context.read<IPlacesModel>(),
                context.read<IFavoritesRepository>(),
              ),
        ),
      ],
      child: Builder(
        builder: (context) => PlacesScreen(wm: context.read<IPlacesWM>()),
      ),
    );
  }
}
