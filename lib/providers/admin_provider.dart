import 'package:flutter/material.dart';

import '../models/admin_model.dart';
import '../resources/auth_methods.dart';

class AdminProvider with ChangeNotifier {
  AdminModel? _adminModel;
  final AuthMethods _authMethods = AuthMethods();

  AdminModel get getUser => _adminModel!;

  Future<void> refreshUser() async {
    AdminModel adminModel = await _authMethods.getAdminDetails();
    _adminModel = adminModel;
    notifyListeners();
  }
}