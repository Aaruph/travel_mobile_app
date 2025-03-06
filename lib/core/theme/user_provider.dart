import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'ishowspeed';
  String _email = 'ishowspeed@gmail.com';
  String _phone = '+9770001663389';

  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  void updateUser(String newName, String newEmail, String newPhone) {
    _name = newName;
    _email = newEmail;
    _phone = newPhone;
    notifyListeners();
  }
}
