import 'package:flutter/material.dart';
import 'package:instagram_flutter/ressources/auth_methods.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  AppUser? _user;
  final AuthMethods _authMethods = AuthMethods();
  AppUser get getUser => _user!;
  Future<void> refreshUser() async {
    AppUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
