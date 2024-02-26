import 'package:flutter/material.dart';

class NavbarProvider with ChangeNotifier {
  // VARIABLES
  int _currentPageIndex = 0;

  // GETTERS
  int get currentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }
}
