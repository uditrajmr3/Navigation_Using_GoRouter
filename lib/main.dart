import 'package:go_router_implementation/utils/app_exports.dart';

void main() {
  runApp(const MyGoRouterNavigationApp());
}

class MyGoRouterNavigationApp extends StatelessWidget {
  const MyGoRouterNavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "GoROuter Implementation",

    );
  }
}
