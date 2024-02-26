import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue,
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
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: const Text('toto'))),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: const Text('toto'))),
              ])),
    );
  }
}
