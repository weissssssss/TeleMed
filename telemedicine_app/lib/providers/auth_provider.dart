import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    if (username == 'test' && password == 'password') {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isAuthenticated', true);
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('isAuthenticated');
    _isAuthenticated = false;
    notifyListeners();
  }
}
jhh