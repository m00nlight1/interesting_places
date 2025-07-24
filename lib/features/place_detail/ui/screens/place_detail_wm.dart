import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/common/models/place.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/herat_animated_widget.dart';

abstract interface class IPlaceDetailWM {
  ValueListenable<String> get stateListenable;

  void dispose();

  void onLikePressed();

  bool isFavorite();

  GlobalKey<HeartAnimatedWidgetState> get heartAnimationKey;
}

class PlaceDetailWM implements IPlaceDetailWM {
  final IPlaceDetailModel _model;
  final IFavoritesRepository _favoritesRepository;
  final Place _place;
  final _heartAnimationKey = GlobalKey<HeartAnimatedWidgetState>();

  PlaceDetailWM(this._model, this._favoritesRepository, this._place);

  @override
  void dispose() => _model.dispose();

  @override
  GlobalKey<HeartAnimatedWidgetState> get heartAnimationKey =>
      _heartAnimationKey;

  @override
  bool isFavorite() => _favoritesRepository.isFavorite(_place);

  @override
  void onLikePressed() {
    final wasFavorite = _favoritesRepository.isFavorite(_place);
    _favoritesRepository.toggleFavorite(_place);

    // Запускаем анимацию только при добавлении в избранное
    if (!wasFavorite) {
      _heartAnimationKey.currentState?.animate();
    }
  }

  @override
  ValueListenable<String> get stateListenable => _model.stateListenable;
}
