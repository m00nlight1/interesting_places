import 'package:flutter/material.dart';
import 'package:interesting_places/models/place.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:interesting_places/widgets/place_detail_content_widget.dart';
import 'package:interesting_places/widgets/place_detail_photo_slider_widget.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;
  final bool isFavorite;

  const PlaceDetailScreen({
    super.key,
    required this.place,
    required this.isFavorite,
  });

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late bool _isFavorite;

  // final _heartAnimationKey = GlobalKey<HeartAnimationWidgetState>();

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _handleLike() {
    final newFavoriteState = !_isFavorite;

    if (newFavoriteState) {
      // _heartAnimationKey.currentState?.animate();
    }
    setState(() {
      _isFavorite = newFavoriteState;
    });
  }

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
                  images: widget.place.images,
                  onBackPressed: () => Navigator.pop(context),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PlaceDetailContentWidget(place: widget.place),
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
                      TextButton.icon(
                        onPressed: _handleLike,
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              _isFavorite
                                  ? colorTheme.error
                                  : colorTheme.textSecondary,
                        ),
                        label: Text(
                          _isFavorite ? 'В Избранном' : 'В Избранное',
                          style: textTheme.bodySmall.copyWith(
                            color: colorTheme.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SafeArea(child: SizedBox.shrink()),
                ]),
              ),
            ],
          ),
          // todo: add widget
          // HeartAnimatedWidget(key: _heartAnimationKey),
        ],
      ),
    );
  }
}
