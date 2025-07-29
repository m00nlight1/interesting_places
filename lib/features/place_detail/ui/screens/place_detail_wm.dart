import 'package:flutter/cupertino.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/herat_animated_widget.dart';

abstract interface class IPlaceDetailWM {
  PlaceEntity get placeEntity;

  void onLikePressed();

  void onBackPressed(BuildContext context);

  bool isFavorite();

  GlobalKey<HeartAnimatedWidgetState> get heartAnimationKey;
}

class PlaceDetailWM implements IPlaceDetailWM {
  final IPlaceDetailModel _model;
  final _heartAnimationKey = GlobalKey<HeartAnimatedWidgetState>();

  PlaceDetailWM(this._model);

  @override
  PlaceEntity get placeEntity => _model.placeEntity;

  @override
  GlobalKey<HeartAnimatedWidgetState> get heartAnimationKey =>
      _heartAnimationKey;

  @override
  bool isFavorite() => _model.isFavorite();

  @override
  void onLikePressed() {
    final needToAnimate = _model.toggleFavorite();

    if (needToAnimate) {
      _heartAnimationKey.currentState?.animate();
    }
  }

  @override
  void onBackPressed(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
