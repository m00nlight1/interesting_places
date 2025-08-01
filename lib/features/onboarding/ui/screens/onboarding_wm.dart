import 'package:flutter/material.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_model.dart';
import 'package:interesting_places/features/tabs_screen/tabs_screen.dart';

abstract interface class IOnboardingWM {
  ValueNotifier<int> get currentPageIndex;

  void onPageChanged(int index);

  void onSkipPressed(BuildContext context);

  void onDonePressed(BuildContext context);
}

class OnboardingWM implements IOnboardingWM {
  final IOnboardingModel _model;
  final ValueNotifier<int> _currentPageIndex = ValueNotifier(0);

  OnboardingWM(this._model);

  @override
  ValueNotifier<int> get currentPageIndex => _currentPageIndex;

  @override
  void onPageChanged(int index) {
    _currentPageIndex.value = index;
  }

  @override
  void onDonePressed(BuildContext context) => _complete(context);

  @override
  void onSkipPressed(BuildContext context) => _complete(context);

  void _complete(BuildContext context) async {
    await _model.completeOnboarding();

    if (!context.mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const TabsScreen()));
  }
}
