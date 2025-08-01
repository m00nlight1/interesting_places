import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/features/places/ui/screens/places_screen_builder.dart';
import 'package:interesting_places/features/settings/ui/screens/settings_screen_builder.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlacesScreenBuilder(),
    const Center(child: Text('Карта (заглушка)')),
    const Center(child: Text('Избранное (заглушка)')),
    const SettingsScreenBuilder(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icList),
            activeIcon: SvgPictureWidget(AppSvgIcons.icListFull),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icMap),
            activeIcon: SvgPictureWidget(AppSvgIcons.icMapFull),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icHeart),
            activeIcon: SvgPictureWidget(AppSvgIcons.icHeartFull),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget(AppSvgIcons.icSettings),
            activeIcon: SvgPictureWidget(AppSvgIcons.icSettingsFull),
            label: '',
          ),
        ],
      ),
    );
  }
}
