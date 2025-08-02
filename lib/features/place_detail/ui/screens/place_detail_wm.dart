import 'package:flutter/cupertino.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/heart_animated_widget.dart';
import 'package:share_plus/share_plus.dart';

abstract interface class IPlaceDetailWM {
  PlaceEntity get placeEntity;

  void onLikePressed();

  void onSharePressed();

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

  @override
  void onSharePressed() {
    final placeName = placeEntity.name;
    SharePlus.instance.share(
      ShareParams(text: '${AppStrings.placeDetailsShareText} $placeName'),
    );
  }
}
