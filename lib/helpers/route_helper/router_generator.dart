import 'package:go_router_implementation/utils/app_exports.dart';
import 'package:go_router_implementation/values/global.dart';

class RouteGenerator {
  static Future<String?> _redirect(
          BuildContext context, GoRouterState s) async =>
      AppGlobals.isAuthenticated ? null : "/${AppRoutes.login}";

  // GoRouter.of(context).location != "/login"
  static Future<String?> _loginRedirect(
      BuildContext context, GoRouterState s) async {
    if (!AppGlobals.isAuthenticated) {
      return "/${AppRoutes.login}";
    }
    if (GoRouter.of(context).location != "/login") {
      return "/";
    }
    return null;
  }

  static GoRouter generateGoRoutes() {
    GoRouter routes = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            path: "/",
            name: AppRoutes.home,
            pageBuilder: (context, state) => const MaterialPage(child: Home()),
            redirect: _redirect),
        GoRoute(
            path: "/${AppRoutes.chat}",
            name: AppRoutes.chat,
            pageBuilder: (context, state) => const MaterialPage(child: Chat()),
            redirect: _redirect),
        GoRoute(
            path: "/${AppRoutes.like}",
            name: AppRoutes.like,
            pageBuilder: (context, state) => const MaterialPage(child: Like()),
            redirect: _redirect),
        GoRoute(
            path: "/${AppRoutes.login}",
            name: AppRoutes.login,
            pageBuilder: (context, state) => const MaterialPage(child: Login()),
            redirect: _loginRedirect),
        GoRoute(
            path: "/${AppRoutes.notification}",
            name: AppRoutes.notification,
            pageBuilder: (context, state) => const MaterialPage(
                child: Notifications()), // add animated transition to this page
            redirect: _redirect),
        GoRoute(
            path: "/${AppRoutes.profile}/:username",
            name: AppRoutes.profile,
            pageBuilder: (context, state) => MaterialPage(
                child:
                    Profile(username: state.pathParameters.values.toString())),
            redirect: _redirect),
        GoRoute(
            path: "/${AppRoutes.settings}",
            name: AppRoutes.settings,
            pageBuilder: (context, state) =>
                const MaterialPage(child: Settings()),
            redirect: _redirect),
      ],
      errorPageBuilder: (context, state) => const MaterialPage(
        child: ErrorScreen(),
      ),
      // redirect: (context, state) {
      //
      // },
    );
    return routes;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const Home(), settings: settings);
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => const Login(), settings: settings);
      case AppRoutes.notification:
        return MaterialPageRoute(
            builder: (_) => const Notifications(), settings: settings);
      case AppRoutes.like:
        return MaterialPageRoute(
            builder: (_) => const Like(), settings: settings);
      case AppRoutes.chat:
        return MaterialPageRoute(
            builder: (_) => const Chat(), settings: settings);
      case AppRoutes.profile:
        return MaterialPageRoute(
            builder: (_) => const Profile(
                  username: "player_unknown",
                ),
            settings: settings);
      case AppRoutes.settings:
        return MaterialPageRoute(
            builder: (_) => const Settings(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const ErrorScreen(), settings: settings);
    }
  }
}
