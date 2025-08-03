import 'package:flutter/material.dart';
import 'package:interesting_places/features/favorites/ui/favorites_dependencies.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_model.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_screen.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_wm.dart';
import 'package:provider/provider.dart';

class FavoritesScreenBuilder extends StatelessWidget {
  const FavoritesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...FavoritesDependencies.providers(),
        Provider<IFavoritesWM>(
          create: (context) => FavoritesWM(context.read<IFavoritesModel>()),
        ),
      ],
      child: Builder(
        builder: (context) => FavoritesScreen(wm: context.read<IFavoritesWM>()),
      ),
    );
  }
}
