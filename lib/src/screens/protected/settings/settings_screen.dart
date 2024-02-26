import 'package:flutter/material.dart';
import 'package:my_birthdays_assistant/src/components/atomics/base_button.dart';
import 'package:my_birthdays_assistant/src/components/settings_header.dart';
import 'settings_controller.dart';
import 'package:provider/provider.dart';
import 'package:my_birthdays_assistant/src/providers/auth_provider.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.controller});
  final SettingsController controller;

  VoidCallback logout(BuildContext context) {
    return () {
      // You can add more logic here if needed
      Provider.of<AuthProvider>(context, listen: false).logout(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          // Glue the SettingsController to the theme selection DropdownButton.
          //
          // When a user selects a theme from the dropdown list, the
          // SettingsController is updated, which rebuilds the MaterialApp.
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Added this line
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        alignment: Alignment.center,
                        child: const SettingsHeader())),
                Expanded(
                    flex: 4,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: BaseButton(
                            label: 'Déconnexion', onPressed: logout(context)))),
              ])),
    );
  }
}
