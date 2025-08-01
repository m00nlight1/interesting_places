import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interesting_places/features/app/app.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  runApp(const App());
}
