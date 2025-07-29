import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/place_detail/place_detail_dependencies.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_screen.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreenBuilder extends StatelessWidget {
  final PlaceEntity place;

  const PlaceDetailScreenBuilder({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlaceDetailDependencies.providers(place),
        Provider<IPlaceDetailWM>(
          create: (context) => PlaceDetailWM(context.read<IPlaceDetailModel>()),
        ),
      ],
      child: Builder(
        builder:
            (context) => PlaceDetailScreen(
              wm: context.read<IPlaceDetailWM>(),
              place: place,
            ),
      ),
    );
  }
}
