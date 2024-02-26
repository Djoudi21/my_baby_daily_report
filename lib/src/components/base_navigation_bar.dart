import 'package:flutter/material.dart';
import '../providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class BaseNavigationBar extends StatelessWidget {
  const BaseNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(builder: (context, navbarProvider, _) {
      return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Réglages',
            ),
          ],
          selectedIndex: navbarProvider.currentPageIndex,
          onDestinationSelected: (int index) {
            navbarProvider.setCurrentPageIndex(index);
          });
    });
  }
}
