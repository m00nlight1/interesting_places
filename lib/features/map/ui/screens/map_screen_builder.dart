import 'package:flutter/material.dart';
import 'package:interesting_places/features/map/domain/services/i_location_service.dart';
import 'package:interesting_places/features/map/ui/map_dependencies.dart';
import 'package:interesting_places/features/map/ui/screens/map_model.dart';
import 'package:interesting_places/features/map/ui/screens/map_screen.dart';
import 'package:interesting_places/features/map/ui/screens/map_wm.dart';
import 'package:provider/provider.dart';

class MapScreenBuilder extends StatelessWidget {
  const MapScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...MapDependencies.providers(),
        Provider<IMapWM>(
          create:
              (context) => MapWM(
                context.read<IMapModel>(),
                context.read<ILocationService>(),
              ),
          dispose: (_, wm) => wm.dispose(),
        ),
      ],
      child: Builder(
        builder: (context) => MapScreen(wm: context.read<IMapWM>()),
      ),
    );
  }
}
