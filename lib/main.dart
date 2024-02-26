import 'package:flutter/material.dart';
import './src/providers/auth_provider.dart';
import './src/providers/navbar_provider.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/screens/protected/settings/settings_controller.dart';
import 'src/screens/protected/settings/settings_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Loads environment variables
  await dotenv.load();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => NavbarProvider()),
  ], child: MyApp(settingsController: settingsController)));
}
