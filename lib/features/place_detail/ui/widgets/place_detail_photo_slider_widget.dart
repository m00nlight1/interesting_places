import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/utils/media_query_extensions.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';

class PlaceDetailPhotoSliderWidget extends StatelessWidget {
  final List<String> images;
  final VoidCallback onBackPressed;

  const PlaceDetailPhotoSliderWidget({
    super.key,
    required this.images,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final topPositionBackButton = context.topPadding + 16;

    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) =>
                            Container(color: colorTheme.imagePlaceholder),
                  );
                },
              ),
              Positioned(
                left: 16,
                top: topPositionBackButton,
                child: CircleAvatar(
                  backgroundColor: colorTheme.primary,
                  child: IconButton(
                    onPressed: onBackPressed,
                    icon: Icon(Icons.arrow_back, color: colorTheme.icon),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
