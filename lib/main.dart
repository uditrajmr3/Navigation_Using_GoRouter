import 'package:go_router_implementation/utils/app_exports.dart';
import 'package:go_router_implementation/values/global.dart';

void main() {
  runApp(const MyGoRouterNavigationApp());
}

class MyGoRouterNavigationApp extends StatelessWidget {
  const MyGoRouterNavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "GoROuter Implementation",
      routeInformationParser:
          RouteGenerator.generateGoRoutes(AppGlobals.isAuthenticated)
              .routeInformationParser,
      routerDelegate:
          RouteGenerator.generateGoRoutes(AppGlobals.isAuthenticated)
              .routerDelegate,
    );
  }
}
