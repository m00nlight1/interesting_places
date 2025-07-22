import 'package:flutter/material.dart';
import 'package:interesting_places/models/place.dart';
import 'package:interesting_places/widgets/place_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mockPlace = Place(
      name: 'Эрмитаж',
      description:
          'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
      type: 'музей',
      images: [
        'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Interesting Places')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: PlaceCardWidget(
            place: mockPlace,
            onCardTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Тап по карточке')));
            },
            onLikeTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Тап по лайку')));
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
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
        onTap: (_) {},
      ),
    );
  }
}
