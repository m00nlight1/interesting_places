import 'package:flutter/foundation.dart';

class PlaceDetailModel implements IPlaceDetailModel {
  final _state = ValueNotifier<String>('Loading');

  @override
  void dispose() => _state.dispose();

  @override
  Future<void> fetchDetail() async {
    _state.value = 'Loaded';
  }

  @override
  ValueListenable<String> get stateListenable => _state;
}

abstract interface class IPlaceDetailModel {
  ValueListenable<String> get stateListenable;

  void dispose();

  Future<void> fetchDetail();
}
