


import 'package:flutter/material.dart';
import 'package:eneba_ecommerce/models/user.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  // Simulate login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock authentication
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUser = User(
        id: '1',
        email: email,
        name: email.split('@').first,
        phone: '+1234567890',
        createdAt: DateTime.now(),
        balance: 50.0,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Simulate registration
  Future<bool> register(String name, String email, String password, String? phone) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock registration
    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      _currentUser = User(
        id: '1',
        email: email,
        name: name,
        phone: phone,
        createdAt: DateTime.now(),
        balance: 0.0,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Logout
  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  // Check if user is logged in
  bool get isLoggedIn => _currentUser != null;
}


