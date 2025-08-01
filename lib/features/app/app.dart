import 'package:flutter/material.dart';
import 'package:interesting_places/core/data/local_storage/preferences_service.dart';
import 'package:interesting_places/features/app/di/app_dependencies.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_screen_builder.dart';
import 'package:interesting_places/features/tabs_screen/tabs_screen.dart';
import 'package:interesting_places/uikit/loading/app_loader.dart';
import 'package:interesting_places/uikit/themes/app_theme_data.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...AppDependencies.providers()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        home: const _AppStartupScreen(),
      ),
    );
  }
}

class _AppStartupScreen extends StatelessWidget {
  const _AppStartupScreen();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<PreferencesService>().hasCompletedOnboarding(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return AppLoader.forScreen();
        }

        final completed = snapshot.data!;
        return completed ? const TabsScreen() : const OnboardingScreenBuilder();
      },
    );
  }
}
