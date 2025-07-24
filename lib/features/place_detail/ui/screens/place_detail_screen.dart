import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/common/models/place.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/place_detail_photo_slider_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/herat_animated_widget.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/place_detail_content_widget.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  final IPlaceDetailWM wm;
  final Place place;

  const PlaceDetailScreen({super.key, required this.wm, required this.place});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 360,
                flexibleSpace: PlaceDetailPhotoSliderWidget(
                  images: place.images,
                  // todo: to WM
                  onBackPressed: () => Navigator.pop(context),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PlaceDetailContentWidget(place: place),
                  ),
                  const SizedBox(height: 24),
                  // todo: add button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: MainButton(),
                  // ),
                  const SizedBox(height: 24),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Builder(
                        builder: (context) {
                          final favoritesRepository =
                              context.read<IFavoritesRepository>();
                          return ValueListenableBuilder<List<Place>>(
                            valueListenable:
                                favoritesRepository.favoritesListenable,
                            builder: (context, favorites, _) {
                              final isFavorite = favorites.any(
                                (f) => f.name == place.name,
                              );
                              return TextButton.icon(
                                onPressed: wm.onLikePressed,
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      isFavorite
                                          ? colorTheme.error
                                          : colorTheme.textSecondary,
                                ),
                                label: Text(
                                  isFavorite ? 'В Избранном' : 'В Избранное',
                                  style: textTheme.bodySmall.copyWith(
                                    color: colorTheme.textSecondary,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SafeArea(child: SizedBox.shrink()),
                ]),
              ),
            ],
          ),
          HeartAnimatedWidget(key: wm.heartAnimationKey),
        ],
      ),
    );
  }
}
