import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:interesting_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/place_detail_photo_slider_widget.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/heart_animated_widget.dart';
import 'package:interesting_places/features/place_detail/ui/widgets/place_detail_content_widget.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  final IPlaceDetailWM wm;
  final PlaceEntity place;

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
                  images: wm.placeEntity.images,
                  onBackPressed: () => wm.onBackPressed(context),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PlaceDetailContentWidget(place: place),
                  ),
                  const SizedBox(height: 24),
                  const Divider(indent: 16, endIndent: 16, thickness: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: wm.onSharePressed,
                        icon: SvgPictureWidget(
                          AppSvgIcons.icShare,
                          color: colorTheme.textSecondary,
                        ),
                        label: Text(
                          AppStrings.placeDetailsShareButton,
                          style: textTheme.small.copyWith(
                            color: colorTheme.textSecondary,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final favoritesRepository =
                              context.read<IFavoritesRepository>();
                          return ValueListenableBuilder<List<PlaceEntity>>(
                            valueListenable:
                                favoritesRepository.favoritesListenable,
                            builder: (context, favorites, _) {
                              final isFavorite = favorites.any(
                                (f) => f.name == place.name,
                              );
                              return TextButton.icon(
                                onPressed: wm.onLikePressed,
                                icon: SvgPictureWidget(
                                  isFavorite
                                      ? AppSvgIcons.icHeartFull
                                      : AppSvgIcons.icHeart,
                                  color:
                                      isFavorite
                                          ? colorTheme.error
                                          : colorTheme.textSecondary,
                                ),
                                label: Text(
                                  isFavorite
                                      ? AppStrings.placeDetailsInFavoritesButton
                                      : AppStrings.placeDetailsFavoritesButton,
                                  style: textTheme.small.copyWith(
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
