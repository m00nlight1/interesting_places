import 'package:flutter/foundation.dart';
import 'package:interesting_places/features/common/models/place.dart';

class PlacesModel implements IPlacesModel {
  final _placesState = ValueNotifier<List<Place>>(_mockPlaces);

  @override
  void dispose() => _placesState.dispose();

  @override
  Future<void> getPlaces() async {
    // Здесь можно добавить задержку или имитацию загрузки
    _placesState.value = _mockPlaces;
  }

  @override
  ValueListenable<List<Place>> get placesStateListenable => _placesState;
}

abstract interface class IPlacesModel {
  ValueListenable<List<Place>> get placesStateListenable;

  void dispose();

  Future<void> getPlaces();
}

final _mockPlaces = [
  Place(
    name: 'Эрмитаж',
    description:
        'Один из крупнейших художественных музеев мира, расположен в Санкт-Петербурге.',
    type: 'музей',
    images: [
      'https://images.unsplash.com/photo-1617401040498-50a842f9246b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
