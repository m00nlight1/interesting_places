import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/assets/strings/app_strings.dart';
import 'package:interesting_places/features/map/domain/entities/map_state.dart';
import 'package:interesting_places/features/map/ui/screens/map_wm.dart';
import 'package:interesting_places/features/map/ui/widgets/location_animated_widget.dart';
import 'package:interesting_places/uikit/error/app_error_widget.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/loading/app_loader.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final IMapWM wm;

  const MapScreen({super.key, required this.wm});

  static const LatLng _defaultCenter = LatLng(55.7558, 37.6176);

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.placesScreenBottomNavPlaces,
          style: textTheme.subtitle,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<MapState>(
        valueListenable: wm.mapStateListenable,
        builder: (context, state, _) {
          return switch (state) {
            MapStateLoading() => AppLoader.forScreen(),
            MapStateFailure(:final failure) => AppErrorWidget(),
            MapStateData(:final markers, :final currentUserLocation) => Stack(
              children: [
                FlutterMap(
                  mapController: wm.mapController,
                  options: MapOptions(
                    initialCenter:
                        markers.isNotEmpty
                            ? markers.first.point
                            : _defaultCenter,
                    minZoom: 3,
                    maxZoom: 18,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.interesting_places',
                    ),
                    if (currentUserLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: currentUserLocation,
                            child: LocationAnimatedWidget(),
                          ),
                        ],
                      ),
                    MarkerLayer(
                      markers:
                          markers.map((marker) {
                            return Marker(
                              point: marker.point,
                              width: marker.isSelected ? 24 : 10,
                              height: marker.isSelected ? 24 : 10,
                              child: InkWell(
                                onTap: () => wm.onMarkerTap(marker),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        marker.isSelected
                                            ? colorTheme.accent
                                            : colorTheme.active,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.moveToCurrentLocation(context),
        shape: const CircleBorder(),
        backgroundColor: colorTheme.primary,
        foregroundColor: colorTheme.textPrimary,
        child: SvgPictureWidget(AppSvgIcons.icGeolocation),
      ),
    );
  }
}
