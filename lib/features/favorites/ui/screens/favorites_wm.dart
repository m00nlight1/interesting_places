import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/favorites/domain/entities/favorite_state.dart';
import 'package:interesting_places/features/favorites/ui/screens/favorites_model.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:share_plus/share_plus.dart';

abstract interface class IFavoritesWM {
  ValueListenable<FavoriteState> get favoritesStateListenable;

  void onPlacePressed(BuildContext context, PlaceEntity place);

  void onRemovePressed(PlaceEntity place);

  void onSharePressed(PlaceEntity place);

  void dispose();
}

class FavoritesWM implements IFavoritesWM {
  final IFavoritesModel _model;

  FavoritesWM(this._model);

  @override
  ValueListenable<FavoriteState> get favoritesStateListenable =>
      _model.favoritesState;

  @override
  void onRemovePressed(PlaceEntity place) => _model.removeFavorite(place);

  @override
  void onPlacePressed(BuildContext context, PlaceEntity place) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PlaceDetailScreenBuilder(place: place)),
    );
  }

  @override
  void onSharePressed(PlaceEntity place) {
    final placeName = place.name;
    SharePlus.instance.share(
      ShareParams(text: '${AppStrings.placeDetailsShareText} $placeName'),
    );
  }

  @override
  void dispose() => _model.dispose();
}
