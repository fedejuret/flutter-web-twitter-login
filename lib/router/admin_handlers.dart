import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = new Handler(
    handlerFunc: (context, params) {
      return LoginView();
    },
  );

  static Handler register = new Handler(
    handlerFunc: (context, params) {
      return RegisterView();
    },
  );
}
