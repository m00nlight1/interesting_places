import 'package:flutter/material.dart';
import 'package:interesting_places/features/places/ui/screens/places_screen_builder.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlacesScreenBuilder(),
    const Center(child: Text('Избранное (заглушка)')),
    const Center(child: Text('Настройки (заглушка)')),
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
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          // todo: переписать icon/activeIcon с SvgPictureWidget
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            // activeIcon: SvgPictureWidget('assets/icons/list_full.svg'),
            label: 'Места',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
