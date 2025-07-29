import 'package:flutter/material.dart';
import 'package:interesting_places/features/common/utils/media_query_extensions.dart';
import 'package:interesting_places/uikit/buttons/back_button_widget.dart';
import 'package:interesting_places/uikit/images/network_image_widget.dart';

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
    final topPositionBackButton = context.topPadding + 16;

    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                itemBuilder:
                    (_, index) =>
                        NetworkImageWidget(imgUrl: images[index], height: 360),
              ),
              Positioned(
                left: 16,
                top: topPositionBackButton,
                child: BackButtonWidget(onPressed: onBackPressed),
              ),
            ],
          ),
        );
      },
    );
  }
}
