import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    this._token = 'klwngkwngnwlgwngl.o2ib45ob2ob52ob.owngnjwlgjlbg';

    LocalStorage.prefs.setString('token', this._token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.navigateTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // Ir al backend a validar el json web token
    await Future.delayed(Duration(milliseconds: 500));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
