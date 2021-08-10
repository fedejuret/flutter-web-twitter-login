import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  // Auth Routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashbord Routes
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Router
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard Route
    router.define(dashboardRoute,
        handler: DashboardHandlers.main, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
