import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/domain/entities/place_entity.dart';
import 'package:interesting_places/features/common/domain/entities/place_type_entity.dart';
import 'package:interesting_places/uikit/images/network_image_widget.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';

class SearchListWidget extends StatelessWidget {
  final List<PlaceEntity> places;
  final ValueChanged<PlaceEntity> onPlacePressed;

  const SearchListWidget({
    super.key,
    required this.places,
    required this.onPlacePressed,
  });

  static const _imageHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.only(top: 32),
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return ListTile(
          leading: SizedBox(
            width: _imageHeight,
            height: _imageHeight,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: NetworkImageWidget(
                height: _imageHeight,
                imgUrl: place.images.firstWhere((_) => true, orElse: () => ''),
              ),
            ),
          ),
          title: Text(
            place.name,
            style: textTheme.text.copyWith(fontWeight: FontWeight.w400),
          ),
          subtitle: Text(place.placeType.displayName, style: textTheme.small),
          onTap: () => onPlacePressed(place),
        );
      },
      separatorBuilder:
          (_, __) => const Divider(
            indent: _imageHeight + 32,
            endIndent: 16,
            height: 4,
            thickness: 0,
          ),
    );
  }
}
