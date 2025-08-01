import 'package:flutter/material.dart';
import 'package:interesting_places/features/settings/ui/screens/settings_screen.dart';
import 'package:interesting_places/features/settings/ui/screens/settings_wm.dart';
import 'package:provider/provider.dart';

class SettingsScreenBuilder extends StatelessWidget {
  const SettingsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ISettingsWM>(
      create: (context) => SettingsWM(),
      child: Builder(
        builder: (context) {
          return SettingsScreen(wm: context.read<ISettingsWM>());
        },
      ),
    );
  }
}
