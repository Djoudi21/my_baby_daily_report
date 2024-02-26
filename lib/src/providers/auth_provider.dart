import '../repositories/dio_auth_repository.dart';
import 'package:flutter/material.dart';
import '../router/route_generator.dart';
import '../providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  final dioAuthRepository = DioAuthRepository();

  // VARIABLES
  String _accessToken = '';
  String _refreshToken = '';
  bool _isLoggedIn = false;
  String _authErrorMessage = '';
  Map<String, dynamic> _currentUser = {"email": '', "id": 1};

  // GETTERS
  String get access => _accessToken;
  String get refresh => _refreshToken;
  bool get isLoggedIn => _isLoggedIn;
  String get authErrorMessage => _authErrorMessage;
  Map<String, dynamic> get currentUser => _currentUser;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void setCurrentUser(Map<String, dynamic> value) {
    _currentUser = value;
    notifyListeners();
  }

  void setTokens(String access, String refresh) {
    _accessToken = access;
    _refreshToken = refresh;
    notifyListeners();
  }

  void setAuthErrorMessage(String value) {
    _authErrorMessage = value;
    notifyListeners();
  }

  void login(
      email, password, context, Function(String) completionCallback) async {
    var response = await dioAuthRepository.login(email, password);
    response.fold(
      (error) {
        // Handle failure
        completionCallback(error.message);
      },
      (data) {
        // Handle success
        setTokens(data.tokens.accessToken, data.tokens.refreshToken);
        setLoggedIn(true);
        setCurrentUser({"email": data.userData.email, "id": data.userData.id});
        // Access AnotherProvider and set its value
        final navbarProvider =
            Provider.of<NavbarProvider>(context, listen: false);
        navbarProvider.setCurrentPageIndex(0);
        completionCallback('');
      },
    );
  }

  void register(
      email, password, context, Function(String) completionCallback) async {
    var response = await dioAuthRepository.register(email, password);
    response.fold(
      (error) {
        // Handle failure
        completionCallback(error.message);
      },
      (data) {
        // Handle success
        setTokens(data.tokens.accessToken, data.tokens.refreshToken);
        setLoggedIn(true);
        setCurrentUser({"email": data.userData.email, "id": data.userData.id});
        // Access AnotherProvider and set its value
        final navbarProvider =
            Provider.of<NavbarProvider>(context, listen: false);
        navbarProvider.setCurrentPageIndex(0);
        completionCallback('');
      },
    );
  }

  void logout(BuildContext context) {
    // Clear tokens and set isLoggedIn to false
    setTokens('', '');
    setLoggedIn(false);

    // Clear current user information
    setCurrentUser({"email": '', "id": 1});

    // Navigate to the login page
    Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
  }
}
