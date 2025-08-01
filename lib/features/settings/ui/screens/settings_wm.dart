import 'package:flutter/material.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_screen_builder.dart';

abstract interface class ISettingsWM {
  void onViewTutorialPressed(BuildContext context);
}

class SettingsWM implements ISettingsWM {
  @override
  void onViewTutorialPressed(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => OnboardingScreenBuilder()));
  }
}
