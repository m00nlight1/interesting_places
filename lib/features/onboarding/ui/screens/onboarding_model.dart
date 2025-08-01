import 'package:interesting_places/core/data/local_storage/preferences_service.dart';

class OnboardingModel implements IOnboardingModel {
  final PreferencesService _preferencesService;

  OnboardingModel({required PreferencesService preferencesService})
    : _preferencesService = preferencesService;

  @override
  Future<void> completeOnboarding() {
    return _preferencesService.setOnboardingCompleted();
  }
}

abstract interface class IOnboardingModel {
  Future<void> completeOnboarding();
}
