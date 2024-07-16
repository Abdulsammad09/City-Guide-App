import 'package:citieguide/model/User.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user; // Store the logged-in user

  User? get user => _user;

  void loginUser(String userName, String userEmail) {
    _user = User(userName: userName, userEmail: userEmail);
    notifyListeners(); // Notify listeners of change
  }

  void logoutUser() {
    _user = null;
    notifyListeners(); // Notify listeners of change
  }
}
