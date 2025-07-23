import 'package:flutter/material.dart';
import 'package:interesting_places/models/place.dart';
import 'package:interesting_places/screens/places_screen.dart';
import 'package:interesting_places/uikit/themes/app_theme_data.dart';

final mockPlaces = [
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
  ),
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home: PlacesScreen(places: mockPlaces),
    );
  }
}
