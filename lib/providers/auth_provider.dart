import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    this._token = 'klwngkwngnwlgwngl.o2ib45ob2ob52ob.owngnjwlgjlbg';
    print('Almacenar Token: $_token');

    LocalStorage.prefs.setString('token', this._token!);

    notifyListeners();
  }
}
