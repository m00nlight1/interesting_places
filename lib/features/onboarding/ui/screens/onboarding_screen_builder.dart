import 'package:flutter/material.dart';
import 'package:interesting_places/features/onboarding/ui/onboarding_dependencies.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_model.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_wm.dart';
import 'package:provider/provider.dart';

class OnboardingScreenBuilder extends StatelessWidget {
  const OnboardingScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...OnboardingDependencies.providers(),
        Provider<IOnboardingWM>(
          create: (context) => OnboardingWM(context.read<IOnboardingModel>()),
        ),
      ],
      child: Builder(
        builder:
            (context) => OnboardingScreen(wm: context.read<IOnboardingWM>()),
      ),
    );
  }
}
