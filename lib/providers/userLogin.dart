import 'package:flutter/material.dart';

class UserLogin with ChangeNotifier {

  bool loginStatus= false;

  Future<void> login() async {
    loginStatus = true;
    //something
    notifyListeners();
  }

  void logout() {
    loginStatus = false;
    //something
    notifyListeners();
  }

}