import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:interesting_places/features/search/domain/entities/search_state.dart';
import 'package:interesting_places/features/search/ui/screens/search_model.dart';

abstract interface class ISearchWM {
  ValueListenable<SearchState> get searchStateListenable;

  TextEditingController get searchController;

  ValueListenable<bool> get hasText;

  void onSearchChanged(String query);

  void onPlacePressed(BuildContext context, PlaceEntity place);

  void onSearchClear();

  void dispose();
}

class SearchWM implements ISearchWM {
  final ISearchModel _model;
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<bool> _hasText = ValueNotifier(false);

  SearchWM({required ISearchModel model}) : _model = model {
    _searchController.addListener(() {
      var hasText = _searchController.text.isNotEmpty;
      _hasText.value = hasText;

      if (!hasText) _model.clearQuery();
    });
  }

  @override
  ValueListenable<SearchState> get searchStateListenable =>
      _model.searchStateListenable;

  @override
  ValueListenable<bool> get hasText => _hasText;

  @override
  TextEditingController get searchController => _searchController;

  @override
  void onSearchChanged(String query) => _model.onQueryChanged(query);

  @override
  void dispose() {
    _model.dispose();
    _searchController.dispose();
    _hasText.dispose();
  }

  @override
  void onPlacePressed(BuildContext context, PlaceEntity place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailScreenBuilder(place: place),
      ),
    );
  }

  @override
  void onSearchClear() {
    _searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    _model.clearQuery();
  }
}
