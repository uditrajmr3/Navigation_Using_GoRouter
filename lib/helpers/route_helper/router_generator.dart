import 'package:go_router_implementation/utils/app_exports.dart';

class RouteGenerator {
  static GoRouter generateGoRoutes(bool isAuthenticated) {
    GoRouter routes = GoRouter(
      initialLocation: (isAuthenticated) ? "/" : "/${AppRoutes.login}",
      routes: [
        GoRoute(
          path: "/",
          name: AppRoutes.home,
          pageBuilder: (context, state) => const MaterialPage(child: Home()),
        ),
        GoRoute(
          path: "/${AppRoutes.chat}",
          name: AppRoutes.chat,
          pageBuilder: (context, state) => const MaterialPage(child: Chat()),
        ),
        GoRoute(
          path: "/${AppRoutes.like}",
          name: AppRoutes.like,
          pageBuilder: (context, state) => const MaterialPage(child: Like()),
        ),
        GoRoute(
          path: "/${AppRoutes.login}",
          name: AppRoutes.login,
          pageBuilder: (context, state) => const MaterialPage(child: Login()),
        ),
        GoRoute(
          path: "/${AppRoutes.notification}",
          name: AppRoutes.notification,
          pageBuilder: (context, state) =>
              const MaterialPage(child: Notifications()),
        ),
        GoRoute(
          path: "/${AppRoutes.profile}/:username",
          name: AppRoutes.profile,
          pageBuilder: (context, state) => MaterialPage(
              child: Profile(username: state.pathParameters.values.toString())),
        ),
        GoRoute(
          path: "/${AppRoutes.settings}",
          name: AppRoutes.settings,
          pageBuilder: (context, state) =>
              const MaterialPage(child: Settings()),
        ),
      ],
      errorPageBuilder: (context, state) => const MaterialPage(
        child: ErrorScreen(),
      ),
      // redirect: (context, state) {
      //   if (!isAuthenticated) {
      //     return context.namedLocation(AppRoutes.login);
      //   } else {
      //     return null;
      //   }
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
