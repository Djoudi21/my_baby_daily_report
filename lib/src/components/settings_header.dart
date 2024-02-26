import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, _) {
      return Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                Text(authProvider.currentUser["email"])
              ]));
    });
  }
}
