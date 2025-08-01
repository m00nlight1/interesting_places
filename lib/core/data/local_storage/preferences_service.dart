import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _hasCompletedOnboarding = "hasCompletedOnboarding";

  const PreferencesService();

  Future<void> setOnboardingCompleted() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_hasCompletedOnboarding, true);
  }

  Future<bool> hasCompletedOnboarding() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_hasCompletedOnboarding) ?? false;
  }
}
