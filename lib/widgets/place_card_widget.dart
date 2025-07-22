import 'package:flutter/material.dart';
import 'package:interesting_places/models/place.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final Place place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final PlaceCardType cardType;

  const PlaceCardWidget({
    super.key,
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
  });

  static const _cardHeight = 188.0;
  static const _imageHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _cardHeight,
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _imageHeight,
                      child: Image.network(
                        place.images.first,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) =>
                                Container(color: Colors.grey.shade300),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.type.toLowerCase(),
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black54),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onCardTap),
              ),
            ),
            Positioned(
              top: 8,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
