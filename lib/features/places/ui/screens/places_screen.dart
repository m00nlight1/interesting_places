import 'package:flutter/material.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/common/ui/search_input_widget.dart';
import 'package:interesting_places/features/places/ui/screens/places_wm.dart';
import 'package:interesting_places/features/places/ui/widgets/places_list_widget.dart';
import 'package:interesting_places/features/search/domain/entities/search_state.dart';
import 'package:interesting_places/features/search/ui/screens/search_wm.dart';
import 'package:interesting_places/features/search/ui/widgets/search_empty_widget.dart';
import 'package:interesting_places/features/search/ui/widgets/search_list_widget.dart';
import 'package:interesting_places/uikit/error/app_error_widget.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class PlacesScreen extends StatelessWidget {
  final IPlacesWM placesWm;
  final ISearchWM searchWM;

  const PlacesScreen({
    super.key,
    required this.placesWm,
    required this.searchWM,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (_, __) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                floating: true,
                snap: true,
                title: Text(
                  AppStrings.placesScreenAppBarTitle,
                  style: textTheme.subtitle,
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(72),
                  child: SearchInputWidget(
                    controller: searchWM.searchController,
                    hasText: searchWM.hasText,
                    onSearchChanged: searchWM.onSearchChanged,
                    onSearchClear: searchWM.onSearchClear,
                  ),
                ),
              ),
            ],
        body: ValueListenableBuilder<SearchState>(
          valueListenable: searchWM.searchStateListenable,
          builder: (context, state, _) {
            return switch (state) {
              SearchStateInitial() => PlacesListWidget(wm: placesWm),
              SearchStateFailure() => const AppErrorWidget(),
              SearchStateEmpty() => const SearchEmptyWidget(),
              SearchStateData(:final places) => SearchListWidget(
                places: places,
                onPlacePressed:
                    (place) => searchWM.onPlacePressed(context, place),
              ),
            };
          },
        ),
      ),
    );
  }
}
