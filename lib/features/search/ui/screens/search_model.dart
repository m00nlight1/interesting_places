import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';
import 'package:interesting_places/features/search/domain/entities/search_state.dart';
import 'package:interesting_places/features/search/domain/repositories/i_search_repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchModel implements ISearchModel {
  final ISearchRepository _searchRepository;

  final _searchState = ValueNotifier<SearchState>(SearchStateInitial());

  final _queryController = BehaviorSubject<String>();

  late final StreamSubscription _searchSubscription;

  SearchModel({required ISearchRepository searchRepository})
    : _searchRepository = searchRepository {
    _searchSubscription = _queryController
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .where((q) => q.trim().length >= 3)
        .switchMap(_searchPlaces)
        .listen((state) {
          _searchState.value = state;
        });
  }

  Stream<SearchState> _searchPlaces(String query) async* {
    final result = await _searchRepository.searchPlaces(query: query);
    switch (result) {
      case ResultOk(:final data):
        yield data.isEmpty ? SearchStateEmpty() : SearchStateData(data);
      case ResultFailed(:final error):
        yield SearchStateFailure(error);
    }
  }

  @override
  void dispose() {
    _queryController.close();
    _searchSubscription.cancel();
    _searchState.dispose();
  }

  @override
  void onQueryChanged(String query) => _queryController.add(query);

  @override
  void clearQuery() {
    _queryController.add('');
    _searchState.value = SearchStateInitial();
  }

  @override
  ValueListenable<SearchState> get searchStateListenable => _searchState;
}

abstract interface class ISearchModel {
  ValueListenable<SearchState> get searchStateListenable;

  void onQueryChanged(String query);

  void clearQuery();

  void dispose();
}
